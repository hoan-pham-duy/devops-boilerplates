# create S3 Bucket:
resource "aws_s3_bucket" "bucket" {
  bucket_prefix = var.bucket_prefix
  force_destroy = true
}

# Create S3 Bucket for terraform state
resource "aws_s3_bucket" "tfstate" {
  bucket_prefix = var.bucket_prefix_tfstate
  force_destroy = true
}

resource "aws_s3_bucket_acl" "bucket_acl_tfstate" {
  depends_on = [aws_s3_bucket_ownership_controls.tfstate]
  bucket = aws_s3_bucket.tfstate.id
  acl    = "private"
}

# block public access 
resource "aws_s3_bucket_public_access_block" "public_block_tfstate" {
  bucket = aws_s3_bucket.tfstate.id

  block_public_acls       = true
  block_public_policy     = true
  restrict_public_buckets = true
  ignore_public_acls      = true
}

resource "aws_s3_bucket_ownership_controls" "tfstate" {
  bucket = aws_s3_bucket.tfstate.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}


resource "aws_s3_bucket_ownership_controls" "website" {
  bucket = aws_s3_bucket.bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

# create bucket ACL :
resource "aws_s3_bucket_acl" "bucket_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.website]
  bucket = aws_s3_bucket.bucket.id
  acl    = "private"
}

# block public access :
resource "aws_s3_bucket_public_access_block" "public_block" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls       = true
  block_public_policy     = true
  restrict_public_buckets = true
  ignore_public_acls      = true
}

# encrypt bucket using SSE-S3:
resource "aws_s3_bucket_server_side_encryption_configuration" "encrypt" {
  bucket = aws_s3_bucket.bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# create S3 website hosting:
resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.bucket.id
  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "error.html"
  }
}

# add bucket policy to let the CloudFront OAI get objects:
resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.bucket.id
  policy = data.aws_iam_policy_document.bucket_policy_document.json
}

#upload website files to s3:
resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.bucket.id

  for_each     = fileset("uploads/", "*")
  key          = "${each.value}"
  source       = "uploads/${each.value}"
  etag         = filemd5("uploads/${each.value}")
  content_type = "text/html"

  depends_on = [
    aws_s3_bucket.bucket
  ]
}

# variable "upload_directory" {
#   default = "../../../frontend/build/"
# }

# variable "mime_types" {
#   default = {
#     htm   = "text/html"
#     html  = "text/html"
#     css   = "text/css"
#     ttf   = "font/ttf"
#     js    = "application/javascript"
#     map   = "application/javascript"
#     json  = "application/json"
#   }
# }

# resource "aws_s3_object" "website_files" {
#   for_each      = fileset(var.upload_directory, "**/*.*")
#   bucket        = aws_s3_bucket.bucket.id
#   key           = replace(each.value, var.upload_directory, "")
#   source        = "${var.upload_directory}${each.value}"
#   acl           = "public-read"
#   etag          = filemd5("${var.upload_directory}${each.value}")
#   content_type  = lookup(var.mime_types, split(".", each.value)[length(split(".", each.value)) - 1])
# }
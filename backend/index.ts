// Import the express in typescript file
import express from 'express';

// Initialize the express engine
const app: express.Application = express();

import dotenv from 'dotenv'
import connectDB from './config/db'

dotenv.config()

connectDB()

// Take a port 8000 for running server.
const port: number = parseInt(process.env.PORT !== undefined? process.env.PORT : "5000")

// Handling '/' Request
app.get('/', (_req, _res) => {
	_res.send("TypeScript With Express");
});

// Server setup
app.listen(port, () => {
	console.log(`TypeScript with Express
		http://localhost:${port}/`);
});

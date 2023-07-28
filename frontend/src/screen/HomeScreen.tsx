import './HomeScreen.css'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faGithub} from '@fortawesome/free-brands-svg-icons'

function HomeScreen() {
  const fetchRootBe: string = ''

  return (
    <div className="home-screen">
      <h3 className="title">DEVOPS BOILERPLATES</h3>
      <button className="github"> <a>Github <FontAwesomeIcon icon={faGithub} /></a></button>
    </div>
  )
}

export default HomeScreen
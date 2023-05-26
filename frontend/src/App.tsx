import React from 'react';
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom'
import { Container } from 'react-bootstrap'

import HomeScreen from './screen/HomeScreen'

function App() {
  return (
    <Router>
      <main>
        <Container>
          <Routes>
            <Route path='/' Component={HomeScreen} />
          </Routes>
        </Container>
      </main>
    </Router>
  );
}

export default App;

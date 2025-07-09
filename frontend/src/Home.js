
import React from 'react';
import { useNavigate } from 'react-router-dom';
import bgImage from './assets/job-bg.jpg';
import './Jobs.css'; 

function Home() {
  const navigate = useNavigate();

  return (
    <div
      style={{
        background: `url(${bgImage}) no-repeat center center/cover`,
        minHeight: '100vh',
        padding: '4rem 1rem',
        position: 'relative',
      }}
    >
      <div
        style={{
          position: 'absolute',
          top: 0, left: 0, right: 0, bottom: 0,
          backgroundColor: 'rgba(240, 240, 240, 0.7)',
          zIndex: 1,
        }}
      />

     
      <div
        style={{
          position: 'relative',
          zIndex: 2,
          maxWidth: '800px',
          margin: '0 auto',
          textAlign: 'center',
          padding: '4rem 2rem',
          background: 'white',
          borderRadius: '16px',
          boxShadow: '0 6px 20px rgba(0,0,0,0.08)',
        }}
      >
        <h1 style={{ fontSize: '2.5rem', marginBottom: '1rem', color: '#007bff' }}>
          Welcome to <span style={{ color: '#0056b3' }}>JobNest</span>
        </h1>
        <p style={{ fontSize: '1.2rem', marginBottom: '2rem', color: '#333' }}>
          Discover top job opportunities and take the next step in your career.
        </p>
        <button className="view-btn" onClick={() => navigate('/jobs')}>
          Browse Jobs
        </button>
      </div>
    </div>
  );
}

export default Home;

import React, { useState, useEffect } from 'react';
import { Link, useLocation, useNavigate } from 'react-router-dom';
import { FaHome, FaPlusCircle, FaSignInAlt, FaSignOutAlt } from 'react-icons/fa';
import './Navbar.css';

function Navbar() {
  const location = useLocation();
  const navigate = useNavigate();
  const isHome = location.pathname === '/';
  const [menuOpen, setMenuOpen] = useState(false);
  const [isLoggedIn, setIsLoggedIn] = useState(false);

  useEffect(() => {
    const token = localStorage.getItem('token');
    setIsLoggedIn(!!token);
  }, [location.pathname]);

  const toggleMenu = () => setMenuOpen(!menuOpen);
  const handleLinkClick = () => setMenuOpen(false);

  const handleLogout = () => {
    localStorage.removeItem('token');
    setIsLoggedIn(false);
    navigate('/');
    window.location.reload();
  };

  return (
    <nav className="navbar">
      <div className="hamburger-icon" onClick={toggleMenu}>
        ☰
      </div>

      <div className={`navbar-links ${menuOpen ? 'open' : ''}`}>
        {!isHome && (
          <Link to="/" className="nav-link" onClick={handleLinkClick}>
            <FaHome style={{ marginRight: '8px' }} />
            Home
          </Link>
        )}
        <Link to="/post" className="nav-link" onClick={handleLinkClick}>
          <FaPlusCircle style={{ marginRight: '8px' }} />
          Post Job
        </Link>

        {isLoggedIn ? (
          <button onClick={handleLogout} className="nav-link logout-btn">
            <FaSignOutAlt style={{ marginRight: '8px' }} />
            Logout
          </button>
        ) : (
          <Link to="/auth" className="nav-link" onClick={handleLinkClick}>
            <FaSignInAlt style={{ marginRight: '8px' }} />
            Login / Register
          </Link>
        )}
      </div>
    </nav>
  );
}

export default Navbar;

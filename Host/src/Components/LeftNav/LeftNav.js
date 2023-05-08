import React from "react";
import { Link } from "react-router-dom";

function LeftNav(props) {
    return (
        <div id="leftNav" className="left-nav-container">
          <nav>
            <div>
              <Link to="/">Page 1</Link>
            </div>
            <div>
              <Link to="page2">Page 2</Link>
            </div>
          </nav>
        </div>
      );
}

export default LeftNav;
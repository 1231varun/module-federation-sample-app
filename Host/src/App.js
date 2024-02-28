import React, { Suspense } from "react";
import "./App.scss";
import TopNav from "./Components/TopNav/TopNav";
import LeftNav from "./Components/LeftNav/LeftNav";
import { Route, Routes } from 'react-router-dom';

const Page1 = React.lazy(() => import("Page1/Page1"));
const Page2 = React.lazy(() => import ('Page2/Page2'));
const Page3 = React.lazy(() => import('Page3/Page3'));

export default function App() {
  return (
    <Suspense fallback={<div>Loading...</div>}>
      <section>
        <TopNav />
        <div className="flex">
          <LeftNav />
          <div className="remote-app">
            <Suspense fallback={<div style={{textAlign: 'center'}}>Loading...</div>}>
              <Routes>
                <Route path="/" element={<Page1 />} />
                <Route path="/page2" element={<Page2 />} />
                <Route path="/page3" element={<Page3 />} />
              </Routes>
            </Suspense>
          </div>
        </div>
      </section>
    </Suspense>
  );
}

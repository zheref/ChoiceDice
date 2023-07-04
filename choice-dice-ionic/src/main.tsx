import React from 'react';
import { createRoot } from 'react-dom/client';
import App from './App';
import { Provider } from 'react-redux';
import { appStore } from './core/appStore';
import { setupIonicReact } from '@ionic/react';

setupIonicReact({
  rippleEffect: true,
  mode: 'ios'
});

const container = document.getElementById('root');
const root = createRoot(container!);
root.render(
  <React.StrictMode>
    <Provider store={appStore}>
      <App />
    </Provider>
  </React.StrictMode>
);
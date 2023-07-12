import { Redirect, Route } from 'react-router-dom';
import {
  IonApp,
  IonIcon,
  IonLabel,
  IonRouterOutlet,
  IonTabBar,
  IonTabButton,
  IonTabs,
  setupIonicReact
} from '@ionic/react';
import { IonReactRouter } from '@ionic/react-router';
import { ellipse, square, triangle, diceOutline, addCircleOutline, personCircleOutline } from 'ionicons/icons';
import Roll from './ui/pages/Roll';
import CreateRoll from './ui/pages/CreateRoll';
import Tab3 from './ui/pages/Tab3';
import Tab2 from './ui/pages/Tab2';

/* Core CSS required for Ionic components to work properly */
import '@ionic/react/css/core.css';

/* Basic CSS for apps built with Ionic */
import '@ionic/react/css/normalize.css';
import '@ionic/react/css/structure.css';
import '@ionic/react/css/typography.css';

/* Optional CSS utils that can be commented out */
import '@ionic/react/css/padding.css';
import '@ionic/react/css/float-elements.css';
import '@ionic/react/css/text-alignment.css';
import '@ionic/react/css/text-transformation.css';
import '@ionic/react/css/flex-utils.css';
import '@ionic/react/css/display.css';

/* Theme variables */
import './ui/theme/variables.css';
import RollDetail from './ui/pages/RollDetail';
import AddRoll from './ui/pages/AddRoll';

setupIonicReact();

const App: React.FC = () => (
  <IonApp>
    <IonReactRouter>
      <IonTabs>
        <IonRouterOutlet>
          <Route exact path="/roll">
            <Roll />
          </Route>
          <Route exact path="/roll/add">
            <AddRoll />
          </Route>
          <Route path="/roll/for/:id" component={RollDetail} />
          <Route exact path="/tab2">
            <Tab2 />
          </Route>
          <Route path="/tab3">
            <Tab3 />
          </Route>
          <Route exact path="/">
            <Redirect to="/roll" />
          </Route>
        </IonRouterOutlet>

        <IonTabBar slot="bottom">
          <IonTabButton tab="roll" href="/roll">
            <IonIcon aria-hidden="true" icon={diceOutline} />
            <IonLabel>Roll</IonLabel>
          </IonTabButton>
          <IonTabButton tab="createRoll" href="/createRoll">
            <IonIcon aria-hidden="true" icon={addCircleOutline} />
            <IonLabel>Create</IonLabel>
          </IonTabButton>
          <IonTabButton tab="tab3" href="/tab3">
            <IonIcon aria-hidden="true" icon={personCircleOutline} />
            <IonLabel>Profile</IonLabel>
          </IonTabButton>
        </IonTabBar>
      </IonTabs>
    </IonReactRouter>
  </IonApp>
);

export default App;

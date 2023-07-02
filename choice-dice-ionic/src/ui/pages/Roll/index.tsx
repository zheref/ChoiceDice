import { IonButton, IonContent, IonHeader, IonItem, IonLabel, IonList, IonPage, IonTitle, IonToolbar } from '@ionic/react';
import ExploreContainer from '../../components/ExploreContainer';
import './styles.css';
import { useSelector } from 'react-redux';

// Store
import { RollState } from '../../../core/rollStore';
import { RootState } from '../../../core/appStore';

const Roll: React.FC = () => {
  const dices = useSelector((state: RootState) => state.roll.dices);

  return (
    <IonPage>
      <IonHeader>
        <IonToolbar>
          <IonTitle>Roll a Dice!</IonTitle>
        </IonToolbar>
      </IonHeader>
      <IonContent fullscreen>
        <IonHeader collapse="condense">
          <IonToolbar>
            <IonTitle size="large">Tab 1</IonTitle>
          </IonToolbar>
        </IonHeader>
        <IonList>
          {dices.map(dice => (
            <IonItem key={dice.id}>
              <IonLabel>{dice.name}</IonLabel>
              {/* <IonButton onClick={() => rollDice(dice.id)}>Roll</IonButton> */}
            </IonItem>
          ))}
        </IonList>
      </IonContent>
    </IonPage>
  );
};

export default Roll;

import { IonButton, IonContent, IonHeader, IonIcon, IonItem, IonItemOption, IonItemOptions, IonItemSliding, IonLabel, IonList, IonPage, IonTitle, IonToolbar, IonFab, IonFabButton } from '@ionic/react';
import ExploreContainer from '../../components/ExploreContainer';
import './styles.css';
import { useDispatch, useSelector } from 'react-redux';

// Store
import { RollState, deleteDice } from '../../../core/rollSlice';
import { RootState } from '../../../core/appStore';
import { trash, add } from 'ionicons/icons';
import { Link } from 'react-router-dom';

const Roll: React.FC = () => {
  const dices = useSelector((state: RootState) => state.roll.dices);
  const dispatch = useDispatch();

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
            <IonTitle size="large">Roll a dice</IonTitle>
          </IonToolbar>
        </IonHeader>
        <IonList>
          {dices.map(dice => (
            <IonItemSliding key={dice.id}>
              <IonItem key={dice.id} routerLink={`/roll/for/${dice.id}`}>
                <IonLabel>{dice.name}</IonLabel>
              </IonItem>
              <IonItemOptions side="end">
                <IonItemOption color="danger">
                  <IonIcon slot="icon-only" icon={trash} onClick={ () => dispatch(deleteDice(dice.id)) } />
                </IonItemOption>
              </IonItemOptions>
            </IonItemSliding>
          ))}
        </IonList>
        <IonFab slot="fixed" vertical="bottom" horizontal="end">
          <Link to="/roll/add">
            <IonFabButton>
              <IonIcon icon={add}></IonIcon>
            </IonFabButton>
          </Link>
        </IonFab>
      </IonContent>
    </IonPage>
  );
};

export default Roll;

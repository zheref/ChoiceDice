import { IonButton, IonContent, IonHeader, IonItem, IonLabel, IonList, IonPage, IonTitle, IonToolbar } from '@ionic/react';
import ExploreContainer from '../../components/ExploreContainer';
import './styles.css';

interface Dice {
  id: number;
  name: string;
  options: string[];
}

// Dices Hardcoded Data Source
// TODO: Migrate to Services
const dices: Dice[] = [
  { id: 1, name: 'Cardio Today', options: ['Elliptical', 'Bike', 'Swimming Pool', 'Park Walk'] },
  { id: 2, name: 'Dinner', options: ['Tuna Avocado', 'Alejandria Salad', 'Tortilla Pizza', 'Benedict Eggs'] },
  { id: 3, name: 'Movie', options: ['The Godfather', 'The Matrix', 'The Lord of the Rings', 'The Shawshank Redemption'] },
  { id: 4, name: 'Game', options: ['Chess', 'Monopoly', 'Poker', 'Dungeons & Dragons'] },
  { id: 5, name: 'Workout', options: ['Push Ups', 'Pull Ups', 'Squats', 'Lunges'] }
]

const Roll: React.FC = () => {
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

import { IonBackButton, IonButton, IonButtons, IonCol, IonContent, IonGrid, IonHeader, IonItem, IonList, IonPage, IonRippleEffect, IonRow, IonText, IonTitle, IonToolbar } from "@ionic/react";
import { RouteComponentProps } from "react-router";
import { RootState } from "../../../core/appStore";
import { useSelector } from "react-redux";
import { Dice } from "../../../core/rollStore";
import takeRandomOptionFrom from "../../../domain/takeRandomOptionFrom";

import './styles.css';

interface RollDetailProps extends RouteComponentProps<{ id: string; }> {}
type Optional<T> = T | undefined;
// type OptionalDice = Dice | undefined

const RollDetail: React.FC<RollDetailProps> = (props) => {
    const dice: Optional<Dice> = useSelector( (state: RootState) => {
        return state.roll.dices.find( dice =>
            `${dice.id}` === props.match.params.id
        )
    })

    return (
        <IonPage>
            <IonHeader>
                <IonToolbar>
                    <IonButtons slot="start">
                        <IonBackButton></IonBackButton>
                    </IonButtons>
                    <IonTitle>
                        {dice?.name}
                    </IonTitle>
                </IonToolbar>
            </IonHeader>
            <IonContent>
                {/* <IonList>
                    {dice?.options.map( option => (
                        <IonItem>
                            {option}
                        </IonItem>
                    ))}
                </IonList> */}
                <IonGrid class="take-all-height">
                    <IonRow className="ion-justify-content-center ion-align-items-center take-all-height">
                        <IonCol size="auto" class="ion-align-items-center">
                            <IonText>
                                <h2>{ takeRandomOptionFrom(dice?.options || []) }</h2>
                            </IonText>
                            <IonButton expand="block">
                                Regenerate
                            </IonButton>
                        </IonCol>
                    </IonRow>
                </IonGrid>
            </IonContent>
        </IonPage>
    );
}

export default RollDetail;
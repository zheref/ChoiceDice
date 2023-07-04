import { IonChip, IonContent, IonHeader, IonItem, IonList, IonPage, IonTitle, IonToolbar } from "@ionic/react";
import { RouteComponentProps } from "react-router";
import { RootState } from "../../../core/appStore";
import { useSelector } from "react-redux";
import { Dice } from "../../../core/rollStore";

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
                    <IonTitle>
                        {dice?.name}
                    </IonTitle>
                </IonToolbar>
            </IonHeader>
            <IonContent>
                <IonList>
                    {dice?.options.map( option => (
                        <IonItem>
                            {option}
                        </IonItem>
                    ))}
                </IonList>
            </IonContent>
        </IonPage>
    );
}

export default RollDetail;
import { IonButton, IonContent, IonHeader, IonIcon, IonInput, IonItem, IonLabel, IonList, IonListHeader, IonPage, IonText, IonTextarea, IonTitle, IonToolbar } from "@ionic/react"
import { add, addCircleOutline } from "ionicons/icons";
import { useCallback, useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { addOption, setName } from "../../../core/addDiceStore";
import { RootState } from "../../../core/appStore";

const AddRoll: React.FC = () => {
    const dispatch = useDispatch();
    const [newOption, setNewOption] = useState<string>("");
    const options = useSelector( (state: RootState) => state.addDice.options );

    const setNameHandler = (event: Event) => {
        const { value } = event.target as HTMLInputElement;
        dispatch(setName(value));
    }

    const setOptionHandler = (event: Event) => {
        const target = event.target as HTMLInputElement;
        console.log(target.value);
        setNewOption(target.value);
    }

    const addOptionHandler = () => {
        dispatch(addOption(newOption));
        setNewOption("");
    }

    return (
        <IonPage>
            <IonHeader>
                <IonToolbar>
                    <IonTitle>Add new roll</IonTitle>
                </IonToolbar> 
            </IonHeader>
      
            <IonContent>
                <IonHeader collapse="condense">
                    <IonToolbar>
                        <IonTitle size="large">Add new roll</IonTitle>
                    </IonToolbar>
                </IonHeader>
                <IonList>
                    <IonItem>
                        <IonInput label="Name" onIonInput={ setNameHandler }></IonInput>
                    </IonItem>
                </IonList>
                <IonList>
                    <IonListHeader>
                        <IonLabel>
                            Options
                        </IonLabel>
                    </IonListHeader>
                    {options.map( option => (
                        <IonItem key={option}>
                            <IonLabel>{option}</IonLabel>
                        </IonItem>
                    ))}
                    <IonItem>
                        <IonInput placeholder="Add option..." value={newOption} onIonInput={ setOptionHandler } />
                        <IonButton fill="clear" onClick={ addOptionHandler } >
                            <IonIcon slot="icon-only" icon={addCircleOutline}></IonIcon>
                        </IonButton>
                    </IonItem>
                </IonList> 
            </IonContent>  
    
        </IonPage>
    )
}

export default AddRoll;
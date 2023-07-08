import { IonContent, IonHeader, IonItem, IonPage, IonText, IonTextarea, IonTitle, IonToolbar } from "@ionic/react"

const AddRoll: React.FC = () => (
    <IonPage>

        <IonHeader>
            <IonToolbar>
                <IonTitle>Add new roll</IonTitle>
            </IonToolbar>
           
        </IonHeader>
        <IonContent>
            <IonItem>
                <IonTextarea label="Roll" labelPlacement="floating"></IonTextarea>
            </IonItem>
        </IonContent>  
    </IonPage>
)

export default AddRoll;
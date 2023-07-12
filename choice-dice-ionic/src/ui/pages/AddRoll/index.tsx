import { IonButton, IonContent, IonFab, IonFabButton, IonHeader, IonIcon, IonInput, IonItem, IonList, IonPage, IonText, IonTextarea, IonTitle, IonToolbar } from "@ionic/react"
import { add, star } from "ionicons/icons";

const AddRoll: React.FC = () => (
    <IonPage>

        <IonHeader>
            <IonToolbar>
                <IonTitle>Add new roll</IonTitle>
            </IonToolbar> 
        </IonHeader>
  
        <IonContent>
            <IonList>
                <IonText><p>Opciones</p></IonText>
                <IonItem>
                    <IonInput label="Name"></IonInput>
                    <IonButton shape="round" >
                        <IonIcon slot="icon-only" icon={add}></IonIcon>
                    </IonButton>
                </IonItem>
            </IonList> 
                
            
        </IonContent>  

    </IonPage>
)

export default AddRoll;
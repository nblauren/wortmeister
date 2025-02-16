import * as functions from "firebase-functions";
import * as admin from "firebase-admin";

admin.initializeApp();
const db = admin.firestore();

export const createSRSItem = functions.firestore
    .document("words/{wordId}")
    .onCreate(async (snap, context) => {
        const wordId = context.params.wordId;

        try {
            // Get document metadata to extract userId (createdBy)
            const wordRef = db.collection("words").doc(wordId);
            const wordSnapshot = await wordRef.get();

            if (!wordSnapshot.exists) {
                console.error(`Word document ${wordId} does not exist, skipping SRS creation.`);
                return null;
            }

            const createdBy = wordSnapshot.get("created_by"); // Extract userId

            if (!createdBy) {
                console.error(`No userId found for word ${wordId}, skipping SRS creation.`);
                return null;
            }

            const srsData = {
                srs_id: db.collection("srs").doc().id, // Auto-generate ID
                user_id: createdBy, // Extract from Firestore metadata
                word_id: wordId,
                last_reviewed: null, // Not reviewed yet
                next_review: admin.firestore.Timestamp.now(), // Due now
                interval: 1, // Initial interval of 1 day
                ease_factor: 2.5, // Default ease factor
                streak: 0, // No streak yet
                review_count: 0, // No reviews yet
                correct_count: 0,
                incorrect_count: 0,
                suspended: false,
            };

            // Create SRS document in Firestore
            await db.collection("srs").doc(srsData.srs_id).set(srsData);
            console.log(`SRS entry created for word ${wordId}`);
        } catch (error) {
            console.error(`Error creating SRS entry for word ${wordId}: `, error);
        }

        return null;
    });

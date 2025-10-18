//
//  AffirmationStore.swift
//  kalmkite-ios
//
//  Created by antair on 10/15/25.
//
final class PowerPoseStore {
    static let shared = PowerPoseStore()
    
    private(set) var poses: [PowerPose] = []
    
    private init() {
        loadPowerPoses()
    }
    
    private func loadPowerPoses() {
        poses = [
            // 1–10: Standing Strong
            PowerPose(title: "CEO Stance", detail: "Stand with feet shoulder-width apart, hands on hips. Feel grounded and confident."),
            PowerPose(title: "Victory Stretch", detail: "Raise both arms above your head in a V shape. Imagine you’ve just won a big deal."),
            PowerPose(title: "Power Lean", detail: "Lean slightly forward with hands on desk. Command presence in the room."),
            PowerPose(title: "Broad Shoulder Posture", detail: "Roll shoulders back, chest out. Opens energy flow and signals confidence."),
            PowerPose(title: "Hands Behind Head", detail: "Interlace fingers behind head, elbows wide. Relax and exude control."),
            PowerPose(title: "Mountain Pose", detail: "Stand tall, arms at sides, feet rooted. Feel strength and stability."),
            PowerPose(title: "The Thinker", detail: "One hand on chin, elbow resting on other hand, legs slightly apart. Boosts focus."),
            PowerPose(title: "Desk Push", detail: "Push slightly against your desk with palms. Builds tension, releases energy."),
            PowerPose(title: "Step Forward Pose", detail: "Step one foot slightly forward, hands on hips. Prepare for action."),
            PowerPose(title: "Power Pivot", detail: "Stand with feet apart, twist torso slowly side to side. Energizes core and mind."),
            
            // 11–20: Arm Power
            PowerPose(title: "Fist Pump", detail: "Pump fists slowly in the air. Releases endorphins and positivity."),
            PowerPose(title: "Arm Cross Lift", detail: "Cross arms across chest, lift elbows slightly. Strengthens mental armor."),
            PowerPose(title: "Air High-Five", detail: "Pretend to give high-fives above head. Boosts excitement and readiness."),
            PowerPose(title: "Superhero Pose", detail: "Hands on hips, chest forward, chin up. Classic confidence pose."),
            PowerPose(title: "Power Stretch Side", detail: "One arm up, one arm down, stretch sideways. Opens energy channels."),
            PowerPose(title: "Shoulder Press", detail: "Raise shoulders up, hold, release. Relieves tension and energizes upper body."),
            PowerPose(title: "Overhead Clasp", detail: "Interlace fingers and stretch arms above head. Lengthens spine and boosts alertness."),
            PowerPose(title: "Wrist Rotation", detail: "Rotate wrists in circles, shake out hands. Prepares for typing or presentation."),
            PowerPose(title: "Torso Twist", detail: "Stand, twist torso gently left and right. Invigorates core and clears mind."),
            PowerPose(title: "Air Boxing", detail: "Slow, controlled punches into the air. Builds energy and confidence."),
            
            // 21–30: Sitting Strong
            PowerPose(title: "Desk Sit Tall", detail: "Sit upright, back straight, feet flat. Feels alert and composed."),
            PowerPose(title: "Chair Lean Back", detail: "Lean back, hands behind head. Releases tension and boosts calm."),
            PowerPose(title: "Seated Power Stretch", detail: "Lift arms overhead while seated. Lengthens spine, energizes body."),
            PowerPose(title: "Leg Cross Lift", detail: "Cross one leg over the other, sit tall. Combines relaxation with poise."),
            PowerPose(title: "Seated Fist Clench", detail: "Clench fists for 3–5 seconds, release slowly. Releases stress."),
            PowerPose(title: "Chair Superman", detail: "Extend one leg and opposite arm forward while seated. Engages focus."),
            PowerPose(title: "Palm Press", detail: "Press palms together at chest, push gently. Activates energy flow."),
            PowerPose(title: "Seated Shoulder Opener", detail: "Clasp hands behind back, stretch chest forward. Opens posture."),
            PowerPose(title: "Calm Gaze", detail: "Sit, close eyes briefly, inhale deeply. Mental reset before calls."),
            PowerPose(title: "Seated Twist", detail: "Twist upper body gently left and right. Refreshes posture and mind."),
            
            // 31–40: Movement & Flow
            PowerPose(title: "Walk Power Steps", detail: "Take 2–3 confident strides. Boosts energy and presence."),
            PowerPose(title: "Desk March", detail: "March in place for 30 seconds. Stimulates blood flow."),
            PowerPose(title: "Air Circles", detail: "Circle arms forward and back. Relieves tension, increases alertness."),
            PowerPose(title: "Leg Pump", detail: "Stand, pump legs gently. Releases fatigue from sitting."),
            PowerPose(title: "Hip Opener", detail: "Place hands on hips, rotate hips slowly. Energizes core."),
            PowerPose(title: "Desk Tap", detail: "Tap desk rhythmically with fingers. Releases nervous energy."),
            PowerPose(title: "Step-Up Stretch", detail: "Place foot on chair edge, stretch forward. Opens hamstrings and mind."),
            PowerPose(title: "Side Step Reach", detail: "Step to the side, stretch arms. Activates lateral energy."),
            PowerPose(title: "Mini Squats", detail: "3–5 slow squats. Builds alertness and confidence."),
            PowerPose(title: "Calf Raise Power", detail: "Raise onto toes, hold, release. Energizes lower body."),
            
            // 41–50: Mental & Emotional Boost
            PowerPose(title: "Deep Breath Warrior", detail: "Inhale deeply, hold, exhale with arms wide. Releases stress."),
            PowerPose(title: "Smile Stretch", detail: "Smile widely, raise eyebrows. Boosts positivity instantly."),
            PowerPose(title: "Fist Over Head Cheer", detail: "Raise fist, imagine a win. Instantly energizing."),
            PowerPose(title: "Palm Heart Center", detail: "Place palms on chest, feel heartbeat. Grounding and calming."),
            PowerPose(title: "Victory Walk", detail: "Walk a few steps imagining achievement. Mental prep for meetings."),
            PowerPose(title: "Focus Finger Point", detail: "Point to something on desk, breathe, focus. Sharpens mind."),
            PowerPose(title: "Brain Wake Shake", detail: "Shake out hands, arms, shoulders quickly. Activates circulation."),
            PowerPose(title: "Power Stare", detail: "Stand tall, gaze forward, inhale confidence. Mental armor."),
            PowerPose(title: "Mind Reset Clap", detail: "Clap hands once, inhale, exhale. Short, energizing reset."),
            PowerPose(title: "Positive Affirmation Pose", detail: "Hands on heart, repeat silently: “I am ready.” Centering and empowering."),
        ]
    }
    
    func getShuffled(count len: Int) -> [PowerPose] {
        guard len > 0 else { return [] }
        let shuffled = poses.shuffled()
        return Array(shuffled.prefix(len))
    }
    
    func getRandomPose() -> PowerPose? {
        return poses.randomElement()
    }
}

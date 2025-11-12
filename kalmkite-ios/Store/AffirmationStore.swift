//
//  AffirmationStore.swift
//  kalmkite-ios
//
//  Created by antair on 10/15/25.
//

import Foundation

final class AffirmationStore {
    static let shared = AffirmationStore()

    private(set) var affirmations: [Affirmation] = []

    private init() {
        affirmations = loadSampleAffirmations() + loadPowerPose()
    }

    private func loadSampleAffirmations() -> [Affirmation] {
        return [
            // .iam — Confidence & Capability
            Affirmation(
                id: UUID(),
                text:
                    "I am fully prepared and ready to share my knowledge with others.",
                detail: "Boosts confidence and readiness.",
                affrimationType: .iam
            ),
            Affirmation(
                id: UUID(),
                text: "I have valuable insights that will benefit my audience.",
                detail: "Recognizes your expertise.",
                affrimationType: .iam
            ),
            Affirmation(
                id: UUID(),
                text:
                    "I am capable of handling any question that comes my way.",
                detail: "Supports your ability to respond.",
                affrimationType: .iam
            ),
            Affirmation(
                id: UUID(),
                text: "I trust in my abilities and expertise.",
                detail: "Strengthens self-belief.",
                affrimationType: .iam
            ),
            Affirmation(
                id: UUID(),
                text: "I am a confident and engaging speaker.",
                detail: "Affirms your presence and delivery.",
                affrimationType: .iam
            ),
            Affirmation(
                id: UUID(),
                text: "I am braver than I feel and stronger than I know.",
                detail: "Encourages courage and self-trust.",
                affrimationType: .iam
            ),
            Affirmation(
                id: UUID(),
                text: "I am proud of myself for showing up and trying.",
                detail: "Celebrates effort and presence.",
                affrimationType: .iam
            ),
            Affirmation(
                id: UUID(),
                text: "I am centered, grounded, and fully present.",
                detail: "Supports emotional grounding.",
                affrimationType: .iam
            ),
            Affirmation(
                id: UUID(),
                text: "I am in control of my thoughts and emotions.",
                detail: "Affirms emotional regulation.",
                affrimationType: .iam
            ),
            Affirmation(
                id: UUID(),
                text: "I communicate with clarity and heart.",
                detail: "Celebrates expressive balance.",
                affrimationType: .iam
            ),

            // .positivity — Success & Positivity
            Affirmation(
                id: UUID(),
                text: "My preparation has equipped me for this moment.",
                detail: "Reinforces readiness and effort.",
                affrimationType: .positivity
            ),
            Affirmation(
                id: UUID(),
                text: "My words have power and clarity.",
                detail: "Highlights your communication strength.",
                affrimationType: .positivity
            ),
            Affirmation(
                id: UUID(),
                text: "My voice matters and my message deserves to be heard.",
                detail: "Affirms your value and voice.",
                affrimationType: .positivity
            ),
            Affirmation(
                id: UUID(),
                text:
                    "I have overcome challenges before, and I will succeed today.",
                detail: "Reminds you of past strength.",
                affrimationType: .positivity
            ),
            Affirmation(
                id: UUID(),
                text: "My resilience is greater than my fear.",
                detail: "Affirms inner strength.",
                affrimationType: .positivity
            ),
            Affirmation(
                id: UUID(),
                text:
                    "Courage is not the absence of fear but acting despite it.",
                detail: "Reframes fear as strength.",
                affrimationType: .positivity
            ),
            Affirmation(
                id: UUID(),
                text:
                    "I rise to meet this moment with grace and determination.",
                detail: "Supports composure and resolve.",
                affrimationType: .positivity
            ),
            Affirmation(
                id: UUID(),
                text: "I trust myself to handle whatever unfolds.",
                detail: "Affirms adaptability.",
                affrimationType: .positivity
            ),
            Affirmation(
                id: UUID(),
                text: "My strength grows each time I face my fears.",
                detail: "Encourages growth through challenge.",
                affrimationType: .positivity
            ),
            Affirmation(
                id: UUID(),
                text:
                    "This presentation will go well, and I will feel accomplished afterward.",
                detail: "Visualizes success.",
                affrimationType: .positivity
            ),
            Affirmation(
                id: UUID(),
                text:
                    "I attract success and positive energy with my confident presence.",
                detail: "Affirms positivity and magnetism.",
                affrimationType: .positivity
            ),

            // .worklifebalance — Calm & Composure
            Affirmation(
                id: UUID(),
                text: "I breathe deeply and release all tension from my body.",
                detail: "Promotes physical relaxation.",
                affrimationType: .worklifebalance
            ),
            Affirmation(
                id: UUID(),
                text: "Calmness flows through me with every breath I take.",
                detail: "Encourages calm and flow.",
                affrimationType: .worklifebalance
            ),
            Affirmation(
                id: UUID(),
                text: "My nerves are simply excitement in disguise.",
                detail: "Reframes anxiety positively.",
                affrimationType: .worklifebalance
            ),
            Affirmation(
                id: UUID(),
                text: "I release perfectionism and embrace authenticity.",
                detail: "Encourages self-acceptance.",
                affrimationType: .worklifebalance
            ),
            Affirmation(
                id: UUID(),
                text: "Peace settles over me as I step into this moment.",
                detail: "Promotes inner peace.",
                affrimationType: .worklifebalance
            ),
            Affirmation(
                id: UUID(),
                text: "My body is relaxed and my mind is clear.",
                detail: "Supports physical and mental ease.",
                affrimationType: .worklifebalance
            ),

            // .gratitude — Connection & Engagement
            Affirmation(
                id: UUID(),
                text: "I connect easily and naturally with my audience.",
                detail: "Affirms relational ease.",
                affrimationType: .gratitude
            ),
            Affirmation(
                id: UUID(),
                text: "People want me to succeed and are rooting for me.",
                detail: "Highlights support and goodwill.",
                affrimationType: .gratitude
            ),
            Affirmation(
                id: UUID(),
                text: "My enthusiasm for this topic is contagious.",
                detail: "Celebrates passion and energy.",
                affrimationType: .gratitude
            ),
            Affirmation(
                id: UUID(),
                text: "I speak with warmth and genuine passion.",
                detail: "Affirms emotional authenticity.",
                affrimationType: .gratitude
            ),
            Affirmation(
                id: UUID(),
                text: "My audience and I are on the same team.",
                detail: "Promotes unity and connection.",
                affrimationType: .gratitude
            ),
            Affirmation(
                id: UUID(),
                text: "I create meaningful connections through my words.",
                detail: "Supports relational impact.",
                affrimationType: .gratitude
            ),
            Affirmation(
                id: UUID(),
                text:
                    "People relate to my message and appreciate my perspective.",
                detail: "Affirms resonance and value.",
                affrimationType: .gratitude
            ),
        ]

    }

    private func loadPowerPose() -> [Affirmation] {

        let powerPoseData: [[String]] = [
            // 1–10: Standing Strong
            [
                "CEO Stance",
                "Stand with feet shoulder-width apart, hands on hips. Feel grounded and confident.",
            ],
            [
                "Victory Stretch",
                "Raise both arms above your head in a V shape. Imagine you’ve just won a big deal.",
            ],
            [
                "Power Lean",
                "Lean slightly forward with hands on desk. Command presence in the room.",
            ],
            [
                "Broad Shoulder Posture",
                "Roll shoulders back, chest out. Opens energy flow and signals confidence.",
            ],
            [
                "Hands Behind Head",
                "Interlace fingers behind head, elbows wide. Relax and exude control.",
            ],
            [
                "Mountain Pose",
                "Stand tall, arms at sides, feet rooted. Feel strength and stability.",
            ],
            [
                "The Thinker",
                "One hand on chin, elbow resting on other hand, legs slightly apart. Boosts focus.",
            ],
            [
                "Desk Push",
                "Push slightly against your desk with palms. Builds tension, releases energy.",
            ],
            [
                "Step Forward Pose",
                "Step one foot slightly forward, hands on hips. Prepare for action.",
            ],
            [
                "Power Pivot",
                "Stand with feet apart, twist torso slowly side to side. Energizes core and mind.",
            ],
            // 11–20: Arm Power
            [
                "Fist Pump",
                "Pump fists slowly in the air. Releases endorphins and positivity.",
            ],
            [
                "Arm Cross Lift",
                "Cross arms across chest, lift elbows slightly. Strengthens mental armor.",
            ],
            [
                "Air High-Five",
                "Pretend to give high-fives above head. Boosts excitement and readiness.",
            ],
            [
                "Superhero Pose",
                "Hands on hips, chest forward, chin up. Classic confidence pose.",
            ],
            [
                "Power Stretch Side",
                "One arm up, one arm down, stretch sideways. Opens energy channels.",
            ],
            [
                "Shoulder Press",
                "Raise shoulders up, hold, release. Relieves tension and energizes upper body.",
            ],
            [
                "Overhead Clasp",
                "Interlace fingers and stretch arms above head. Lengthens spine and boosts alertness.",
            ],
            [
                "Wrist Rotation",
                "Rotate wrists in circles, shake out hands. Prepares for typing or presentation.",
            ],
            [
                "Torso Twist",
                "Stand, twist torso gently left and right. Invigorates core and clears mind.",
            ],
            [
                "Air Boxing",
                "Slow, controlled punches into the air. Builds energy and confidence.",
            ],
            // 21–30: Sitting Strong
            [
                "Desk Sit Tall",
                "Sit upright, back straight, feet flat. Feels alert and composed.",
            ],
            [
                "Chair Lean Back",
                "Lean back, hands behind head. Releases tension and boosts calm.",
            ],
            [
                "Seated Power Stretch",
                "Lift arms overhead while seated. Lengthens spine, energizes body.",
            ],
            [
                "Leg Cross Lift",
                "Cross one leg over the other, sit tall. Combines relaxation with poise.",
            ],
            [
                "Seated Fist Clench",
                "Clench fists for 3–5 seconds, release slowly. Releases stress.",
            ],
            [
                "Chair Superman",
                "Extend one leg and opposite arm forward while seated. Engages focus.",
            ],
            [
                "Palm Press",
                "Press palms together at chest, push gently. Activates energy flow.",
            ],
            [
                "Seated Shoulder Opener",
                "Clasp hands behind back, stretch chest forward. Opens posture.",
            ],
            [
                "Calm Gaze",
                "Sit, close eyes briefly, inhale deeply. Mental reset before calls.",
            ],
            [
                "Seated Twist",
                "Twist upper body gently left and right. Refreshes posture and mind.",
            ],
            // 41–50: Mental & Emotional Boost
            [
                "Deep Breath Warrior",
                "Inhale deeply, hold, exhale with arms wide. Releases stress.",
            ],
            [
                "Smile Stretch",
                "Smile widely, raise eyebrows. Boosts positivity instantly.",
            ],
            [
                "Fist Over Head Cheer",
                "Raise fist, imagine a win. Instantly energizing.",
            ],
            [
                "Palm Heart Center",
                "Place palms on chest, feel heartbeat. Grounding and calming.",
            ],
            [
                "Victory Walk",
                "Walk a few steps imagining achievement. Mental prep for meetings.",
            ],
            [
                "Focus Finger Point",
                "Point to something on desk, breathe, focus. Sharpens mind.",
            ],
            [
                "Brain Wake Shake",
                "Shake out hands, arms, shoulders quickly. Activates circulation.",
            ],
            [
                "Power Stare",
                "Stand tall, gaze forward, inhale confidence. Mental armor.",
            ],
            [
                "Mind Reset Clap",
                "Clap hands once, inhale, exhale. Short, energizing reset.",
            ],
            [
                "Positive Affirmation Pose",
                "Hands on heart, repeat silently: “I am ready.” Centering and empowering.",
            ],
        ]

        return powerPoseData.map { data in
            Affirmation(
                id: UUID(),
                text: data[0],
                detail: data[1],
                affrimationType: .powerpose
            )
        }
    }

//    func getShuffled(count len: Int) -> [Affirmation] {
//        guard len > 0 else { return [] }
//        let shuffled = affirmations.shuffled()
//        return Array(shuffled.prefix(len))
//    }

    func getRandomAffirmation() -> Affirmation? {
        return affirmations.randomElement()
    }

    func getAffirmationsByType(affirmationType: AffirmationType, count: Int)
        -> [Affirmation]
    {
        let filtered = affirmations.filter {
            $0.affrimationType == affirmationType
        }
        if count >= filtered.count {
            return filtered.shuffled()
        }
        return Array(filtered.shuffled().prefix(count))
    }
}

//
//  AffirmationStore.swift
//  kalmkite-ios
//
//  Created by antair on 10/15/25.
//
final class AffirmationStore {
    static let shared = AffirmationStore()

    private(set) var affirmations: [String] = []

    private init() {
        loadSampleAffirmations()
    }

    private func loadSampleAffirmations() {
        affirmations = [
            // Confidence & Capability
            "I am fully prepared and ready to share my knowledge with others.",
            "My voice matters and my message deserves to be heard.",
            "I have valuable insights that will benefit my audience.",
            "I am capable of handling any question that comes my way.",
            "My preparation has equipped me for this moment.",
            "I trust in my abilities and expertise.",
            "I am a confident and engaging speaker.",
            "My words have power and clarity.",

            // Calm & Composure
            "I breathe deeply and release all tension from my body.",
            "Calmness flows through me with every breath I take.",
            "I am centered, grounded, and fully present.",
            "My nerves are simply excitement in disguise.",
            "I release perfectionism and embrace authenticity.",
            "I am in control of my thoughts and emotions.",
            "Peace settles over me as I step into this moment.",
            "My body is relaxed and my mind is clear.",

            // Connection & Engagement
            "I connect easily and naturally with my audience.",
            "People want me to succeed and are rooting for me.",
            "My enthusiasm for this topic is contagious.",
            "I speak with warmth and genuine passion.",
            "My audience and I are on the same team.",
            "I create meaningful connections through my words.",
            "People relate to my message and appreciate my perspective.",
            "I communicate with clarity and heart.",

            // Growth & Perspective
            "Every presentation makes me stronger and more skilled.",
            "This is an opportunity to grow, not a test to pass.",
            "Imperfection is human, and humans are what people connect with.",
            "I learn something valuable from every speaking experience.",
            "My worth is not determined by this one presentation.",
            "Challenges help me discover my true strength.",
            "I embrace this moment as a chance to shine.",
            "Each time I present, I become more comfortable and confident.",

            // Present Moment Awareness
            "I am fully present and engaged in this moment.",
            "I focus on my message, not my anxiety.",
            "Right here, right now, I am exactly where I need to be.",
            "I let go of worrying about the outcome and focus on the process.",
            "This moment is mine to own and enjoy.",
            "I am here, I am ready, and I am enough.",
            "I release thoughts of the past and future, staying anchored in now.",
            "My attention is on serving my audience, not judging myself.",

            // Strength & Resilience
            "I have overcome challenges before, and I will succeed today.",
            "My resilience is greater than my fear.",
            "I am braver than I feel and stronger than I know.",
            "Courage is not the absence of fear but acting despite it.",
            "I rise to meet this moment with grace and determination.",
            "I trust myself to handle whatever unfolds.",
            "My strength grows each time I face my fears.",
            "I am proud of myself for showing up and trying.",

            // Success & Positivity
            "This presentation will go well, and I will feel accomplished afterward.",
            "I attract success and positive energy with my confident presence.",
        ]
    }

    func getShuffled(count len: Int) -> [String] {
        guard len > 0 else { return [] }
        let shuffled = affirmations.shuffled()
        return Array(shuffled.prefix(len))
    }

    func getRandomAffirmation() -> String? {
        return affirmations.randomElement()
    }
}

import 'package:chest_disease_prediction/constants/app_assets.dart';
import '../data/onboarding_model/onboarding_model.dart';

// This statement form type list about on Boarding screen in app
List<OnBoardingModel> onBoardingModelList = [
  OnBoardingModel(
    title: "Heartburn or indigestion",
    image: AppAssets.onBoardingChest1,
    body:
        "Starts after eating, bringing up food or bitter tasting fluids, feeling full and bloated.",
  ),
  OnBoardingModel(
    title: "Chest sprain or strain",
    image: AppAssets.onBoardingChest2,
    body:
        "Starts after chest injury or chest exercise, feels better when resting the muscle.",
  ),
  OnBoardingModel(
    title: "Anxiety or panic",
    image: AppAssets.onBoardingChest3,
    body:
        "Triggered by worries or a stressful situation, heartbeat gets faster, sweating, dizziness.",
  ),
  OnBoardingModel(
    title: "Chest infection or pneumonia",
    image: AppAssets.onBoardingChest4,
    body:
        "Gets worse when you breathe in and out, coughing up yellow or green mucus, high temperature.",
  ),
  OnBoardingModel(
    title: "Shingles",
    image: AppAssets.onBoardingChest5,
    body:
        "Tingling feeling on skin, skin rash appears that turns into blisters.",
  ),
];

import 'package:flutter/material.dart';
import 'package:pet_gallery/services/api/pet_api.dart';
import 'package:pet_gallery/services/repository/pet_repository.dart';
import 'package:pet_gallery/ui/screens/image_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // State variable to differentiate between loading and ideal state
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFFFFFFF),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/dog_lover copy.png"),
              const SizedBox(height: 28),
              Text(
                "Hi, I see a dog-lover in you.\n Please take a look at this image of a cute dog\n by clicking on the button below",
                style: Theme.of(context)
                    .textTheme
                    .caption
                    ?.copyWith(color: Colors.grey[400], fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 110,
                child: Center(
                  child: _isLoading
                      // Shows loder while fetching data from API
                      ? const CircularProgressIndicator(color: Colors.blue)
                      // If API fetch is compeleted or app is in ideal state then
                      // shows the button
                      : ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            padding: const EdgeInsets.symmetric(
                              vertical: 18,
                              horizontal: 28,
                            ),
                          ),
                          onPressed: () => _fetchImageUrl(context),
                          icon: const Icon(Icons.pets),
                          label: Text(
                            "Show a Dog's Photo",
                            style: Theme.of(context)
                                .textTheme
                                .button
                                ?.copyWith(color: Colors.white),
                          ),
                        ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

// Function for fetching image url from API
  Future<void> _fetchImageUrl(BuildContext context) async {
    // Setting state to loading so that loader will show while executing this function
    setState(() {
      _isLoading = true;
    });
    final PetApi _api = PetApi();
    final PetRepository _repo = PetRepository(api: _api);
    await Future.delayed(const Duration(milliseconds: 400));
    try {
      final data = await _repo.fetchPetPhotoUrl();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ImageScreen(imageUrl: data.message),
        ),
      );
    } catch (e) {
      // If any occured during API call and json parsing
      // a dialogue box will be shown to user
      _showErroDialogue(context);
    }
    // Setting state to ideal so that loader could be replaced with button
    setState(() {
      _isLoading = false;
    });
    return;
  }

  void _showErroDialogue(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Error Occured!",
          style: Theme.of(context).textTheme.headline5,
        ),
        content: Text(
          "An error occured while trying to show image. Please try again after some time.",
          style: Theme.of(context).textTheme.bodyText2,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }
}

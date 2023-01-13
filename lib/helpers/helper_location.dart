const googleAPIKey = 'AIzaSyBg9yn5JtQgKRFbg6FCTу4ewbF24kRuAYI';
const mySignature = 'rishabhsaini619';

class LocationHelper {
  static String generateLocationPreviewImage({
    required double locationLatitude,
    required double locationLongitude,
  }) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$locationLatitude,$locationLongitude&zoom=16&size=350x200&maptype=roadmap&markers=color:red%7Clabel:C%7C$locationLatitude,$locationLongitude&key=$googleAPIKey&signature=$mySignature';
  }
}

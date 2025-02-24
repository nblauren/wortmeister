import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Avatar extends StatefulWidget {
  final String userid;

  const Avatar({super.key, required this.userid});

  @override
  State<Avatar> createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  String? _imageUrl;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _loadAvatar();
  }

  Future<void> _loadAvatar() async {
    try {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.userid)
          .get();
      if (userDoc.exists) {
        setState(() {
          _imageUrl = userDoc['photoUrl'];
        });
      }
    } catch (e) {
      print('Error loading avatar: $e');
    }
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      String fileName = '${widget.userid}_avatar.jpg';
      try {
        TaskSnapshot uploadTask = await FirebaseStorage.instance
            .ref('avatars/$fileName')
            .putFile(imageFile);
        String downloadUrl = await uploadTask.ref.getDownloadURL();
        await FirebaseFirestore.instance
            .collection('users')
            .doc(widget.userid)
            .update({'photoUrl': downloadUrl});
        setState(() {
          _imageUrl = downloadUrl;
        });
      } catch (e) {
        print('Error uploading avatar: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: CircleAvatar(
        radius: 50,
        backgroundImage: _imageUrl != null
            ? NetworkImage(_imageUrl!)
            : AssetImage('assets/default_avatar.png') as ImageProvider,
      ),
    );
  }
}

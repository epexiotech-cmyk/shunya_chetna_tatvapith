import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BillingController extends GetxController
    with GetTickerProviderStateMixin {
  TextEditingController searchController = TextEditingController();
  RxList<Map<String, String>> billingList = [
    {
      "name": "Ramesh Patel",
      "mobile": "9876543210",
      "address": "Vadodara",
      "amount": "500",
    },
    {
      "name": "Suresh Shah",
      "mobile": "9825147852",
      "address": "Ahmedabad",
      "amount": "1200",
    },
    {
      "name": "Mahesh Joshi",
      "mobile": "9874563210",
      "address": "Surat",
      "amount": "1400",
    },
    {
      "name": "Ketan Desai",
      "mobile": "9898765432",
      "address": "Rajkot",
      "amount": "500",
    },
    {
      "name": "Amit Mehta",
      "mobile": "9812345678",
      "address": "Bhavnagar",
      "amount": "1900",
    },
    {
      "name": "Dharmesh Shah",
      "mobile": "9901234567",
      "address": "Anand",
      "amount": "320",
    },
    {
      "name": "Nilesh Parmar",
      "mobile": "9871204563",
      "address": "Nadiad",
      "amount": "2000",
    },
    {
      "name": "Hardik Patel",
      "mobile": "9898123456",
      "address": "Surendranagar",
      "amount": "1500",
    },
    {
      "name": "Jignesh Shah",
      "mobile": "9811123456",
      "address": "Gandhinagar",
      "amount": "380",
    },
    {
      "name": "Rajesh Trivedi",
      "mobile": "9874567890",
      "address": "Palanpur",
      "amount": "20",
    },
    {
      "name": "Bhavesh Patel",
      "mobile": "9898989898",
      "address": "Mehsana",
      "amount": "90",
    },
    {
      "name": "Hitesh Shah",
      "mobile": "9876547890",
      "address": "Junagadh",
      "amount": "680",
    },
    {
      "name": "Vikas Patel",
      "mobile": "9822233344",
      "address": "Amreli",
      "amount": "570",
    },
    {
      "name": "Parth Mehta",
      "mobile": "9811198765",
      "address": "Botad",
      "amount": "150",
    },
    {
      "name": "Rohit Shah",
      "mobile": "9898111122",
      "address": "Morbi",
      "amount": "250",
    },
    {
      "name": "Manish Patel",
      "mobile": "9873216540",
      "address": "Porbandar",
      "amount": "400",
    },
    {
      "name": "Alpesh Desai",
      "mobile": "9812340098",
      "address": "Valsad",
      "amount": "500",
    },
    {
      "name": "Yogesh Shah",
      "mobile": "9898001122",
      "address": "Navsari",
      "amount": "900",
    },
    {
      "name": "Tushar Patel",
      "mobile": "9870001234",
      "address": "Bharuch",
      "amount": "700",
    },
    {
      "name": "Chirag Mehta",
      "mobile": "9812345670",
      "address": "Dahod",
      "amount": "1000",
    },
  ].obs;
}

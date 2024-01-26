cmake_minimum_required(VERSION 3.16)
project(LoyaltyApp LANGUAGES C CXX Swift)
add_subdirectory("../../" UIKit)

add_library(LoyaltyApp SHARED 
    ./LoyaltyApp/ViewController.swift
    ./LoyaltyApp/androidMain.swift
    ./LoyaltyApp/AppDelegate.swift
)

target_link_libraries(LoyaltyApp PRIVATE UIKit JNI SDL)
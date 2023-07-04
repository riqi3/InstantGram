//
//  Generated file. Do not edit.
//

import FlutterMacOS
import Foundation

<<<<<<< HEAD
import firebase_core

func RegisterGeneratedPlugins(registry: FlutterPluginRegistry) {
  FLTFirebaseCorePlugin.register(with: registry.registrar(forPlugin: "FLTFirebaseCorePlugin"))
=======
import facebook_auth_desktop
import firebase_auth
import firebase_core
import flutter_secure_storage_macos

func RegisterGeneratedPlugins(registry: FlutterPluginRegistry) {
  FacebookAuthDesktopPlugin.register(with: registry.registrar(forPlugin: "FacebookAuthDesktopPlugin"))
  FLTFirebaseAuthPlugin.register(with: registry.registrar(forPlugin: "FLTFirebaseAuthPlugin"))
  FLTFirebaseCorePlugin.register(with: registry.registrar(forPlugin: "FLTFirebaseCorePlugin"))
  FlutterSecureStoragePlugin.register(with: registry.registrar(forPlugin: "FlutterSecureStoragePlugin"))
>>>>>>> 2eb6e50bc7022c35bf6000c66e0c8603b7cf5b66
}

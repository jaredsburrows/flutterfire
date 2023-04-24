package io.flutter.plugins.firebase.auth;

import android.app.Activity;
import android.net.Uri;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import com.google.android.gms.tasks.Tasks;
import com.google.firebase.FirebaseApp;
import com.google.firebase.auth.AuthCredential;
import com.google.firebase.auth.AuthResult;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseAuthMultiFactorException;
import com.google.firebase.auth.FirebaseUser;
import com.google.firebase.auth.GetTokenResult;
import com.google.firebase.auth.OAuthProvider;
import com.google.firebase.auth.PhoneAuthCredential;
import com.google.firebase.auth.UserProfileChangeRequest;
import java.util.Map;
import java.util.concurrent.ExecutionException;

public class FlutterFirebaseAuthUser
    implements GeneratedAndroidFirebaseAuth.FirebaseAuthUserHostApi {

  private Activity activity;

  public void setActivity(Activity activity) {
    this.activity = activity;
  }

  public static FirebaseUser getCurrentUserFromPigeon(
      @NonNull GeneratedAndroidFirebaseAuth.PigeonFirebaseApp pigeonApp) {
    FirebaseApp app = FirebaseApp.getInstance(pigeonApp.getAppName());
    FirebaseAuth auth = FirebaseAuth.getInstance(app);
    if (pigeonApp.getTenantId() != null) {
      auth.setTenantId(pigeonApp.getTenantId());
    }

    return auth.getCurrentUser();
  }

  @Override
  public void delete(
      @NonNull GeneratedAndroidFirebaseAuth.PigeonFirebaseApp app,
      @NonNull GeneratedAndroidFirebaseAuth.Result<Void> result) {
    try {
      FirebaseUser firebaseUser = getCurrentUserFromPigeon(app);

      if (firebaseUser == null) {
        result.error(FlutterFirebaseAuthPluginException.noUser());
        return;
      }

      Tasks.await(firebaseUser.delete());
      result.success(null);
    } catch (Exception e) {
      result.error(e);
    }
  }

  @Override
  public void getIdToken(
      @NonNull GeneratedAndroidFirebaseAuth.PigeonFirebaseApp app,
      @NonNull Boolean forceRefresh,
      @NonNull
          GeneratedAndroidFirebaseAuth.Result<GeneratedAndroidFirebaseAuth.PigeonIdTokenResult>
              result) {
    try {
      FirebaseUser firebaseUser = getCurrentUserFromPigeon(app);

      if (firebaseUser == null) {
        result.error(FlutterFirebaseAuthPluginException.noUser());
        return;
      }

      GetTokenResult tokenResult = Tasks.await(firebaseUser.getIdToken(forceRefresh));
      result.success(PigeonParser.parseTokenResult(tokenResult));
    } catch (Exception e) {
      result.error(e);
    }
  }

  @Override
  public void linkWithCredential(
      @NonNull GeneratedAndroidFirebaseAuth.PigeonFirebaseApp app,
      @NonNull Map<String, Object> input,
      @NonNull
          GeneratedAndroidFirebaseAuth.Result<GeneratedAndroidFirebaseAuth.PigeonUserCredential>
              result) {
    try {
      FirebaseUser firebaseUser = getCurrentUserFromPigeon(app);
      AuthCredential credential = PigeonParser.getCredential(input);

      if (firebaseUser == null) {
        result.error(FlutterFirebaseAuthPluginException.noUser());
        return;
      }

      if (credential == null) {
        result.error(FlutterFirebaseAuthPluginException.invalidCredential());
        return;
      }

      AuthResult authResult;

      authResult = Tasks.await(firebaseUser.linkWithCredential(credential));

      result.success(PigeonParser.parseAuthResult(authResult));
    } catch (Exception e) {
      if (e.getCause() instanceof FirebaseAuthMultiFactorException) {
        FlutterFirebaseMultiFactor.handleMultiFactorException(app, result, e);
        return;
      }
      String message = e.getMessage();

      if (message != null
          && message.contains("User has already been linked to the given provider.")) {
        result.error(FlutterFirebaseAuthPluginException.alreadyLinkedProvider());
        return;
      }

      result.error(e);
    }
  }

  @Override
  public void linkWithProvider(
      @NonNull GeneratedAndroidFirebaseAuth.PigeonFirebaseApp app,
      @NonNull GeneratedAndroidFirebaseAuth.PigeonSignInProvider signInProvider,
      @NonNull
          GeneratedAndroidFirebaseAuth.Result<GeneratedAndroidFirebaseAuth.PigeonUserCredential>
              result) {
    try {
      FirebaseUser firebaseUser = getCurrentUserFromPigeon(app);

      OAuthProvider.Builder provider = OAuthProvider.newBuilder(signInProvider.getProviderId());
      if (signInProvider.getScopes() != null) {
        provider.setScopes(signInProvider.getScopes());
      }
      if (signInProvider.getCustomParameters() != null) {
        provider.addCustomParameters(signInProvider.getCustomParameters());
      }

      AuthResult authResult =
          Tasks.await(firebaseUser.startActivityForLinkWithProvider(activity, provider.build()));
      result.success(PigeonParser.parseAuthResult(authResult));
    } catch (Exception e) {
      if (e.getCause() instanceof FirebaseAuthMultiFactorException) {
        FlutterFirebaseMultiFactor.handleMultiFactorException(app, result, e);
      } else {
        result.error(e);
      }
    }
  }

  @Override
  public void reauthenticateWithCredential(
      @NonNull GeneratedAndroidFirebaseAuth.PigeonFirebaseApp app,
      @NonNull Map<String, Object> input,
      @NonNull
          GeneratedAndroidFirebaseAuth.Result<GeneratedAndroidFirebaseAuth.PigeonUserCredential>
              result) {
    try {
      FirebaseUser firebaseUser = getCurrentUserFromPigeon(app);
      AuthCredential credential = PigeonParser.getCredential(input);

      if (firebaseUser == null) {
        result.error(FlutterFirebaseAuthPluginException.noUser());
        return;
      }

      if (credential == null) {
        result.error(FlutterFirebaseAuthPluginException.invalidCredential());
        return;
      }

      AuthResult authResult = Tasks.await(firebaseUser.reauthenticateAndRetrieveData(credential));
      result.success(PigeonParser.parseAuthResult(authResult));
    } catch (Exception e) {
      if (e.getCause() instanceof FirebaseAuthMultiFactorException) {
        FlutterFirebaseMultiFactor.handleMultiFactorException(app, result, e);
      } else {
        result.error(e);
      }
    }
  }

  @Override
  public void reauthenticateWithProvider(
      @NonNull GeneratedAndroidFirebaseAuth.PigeonFirebaseApp app,
      @NonNull GeneratedAndroidFirebaseAuth.PigeonSignInProvider signInProvider,
      @NonNull
          GeneratedAndroidFirebaseAuth.Result<GeneratedAndroidFirebaseAuth.PigeonUserCredential>
              result) {
    try {
      FirebaseUser firebaseUser = getCurrentUserFromPigeon(app);

      OAuthProvider.Builder provider = OAuthProvider.newBuilder(signInProvider.getProviderId());
      if (signInProvider.getScopes() != null) {
        provider.setScopes(signInProvider.getScopes());
      }
      if (signInProvider.getCustomParameters() != null) {
        provider.addCustomParameters(signInProvider.getCustomParameters());
      }

      AuthResult authResult =
          Tasks.await(
              firebaseUser.startActivityForReauthenticateWithProvider(activity, provider.build()));
      result.success(PigeonParser.parseAuthResult(authResult));
    } catch (Exception e) {
      if (e.getCause() instanceof FirebaseAuthMultiFactorException) {
        FlutterFirebaseMultiFactor.handleMultiFactorException(app, result, e);
      } else {
        result.error(e);
      }
    }
  }

  @Override
  public void reload(
      @NonNull GeneratedAndroidFirebaseAuth.PigeonFirebaseApp app,
      @NonNull
          GeneratedAndroidFirebaseAuth.Result<GeneratedAndroidFirebaseAuth.PigeonUserDetails>
              result) {
    try {
      FirebaseUser firebaseUser = getCurrentUserFromPigeon(app);

      if (firebaseUser == null) {
        result.error(FlutterFirebaseAuthPluginException.noUser());
        return;
      }

      Tasks.await(firebaseUser.reload());

      result.success(PigeonParser.parseFirebaseUser(getCurrentUserFromPigeon(app)));
    } catch (Exception e) {
      result.error(e);
    }
  }

  @Override
  public void sendEmailVerification(
      @NonNull GeneratedAndroidFirebaseAuth.PigeonFirebaseApp app,
      @Nullable GeneratedAndroidFirebaseAuth.PigeonActionCodeSettings actionCodeSettings,
      @NonNull GeneratedAndroidFirebaseAuth.Result<Void> result) {
    try {
      FirebaseUser firebaseUser = getCurrentUserFromPigeon(app);

      if (firebaseUser == null) {
        result.error(FlutterFirebaseAuthPluginException.noUser());
        return;
      }

      if (actionCodeSettings == null) {
        Tasks.await(firebaseUser.sendEmailVerification());
        result.success(null);
        return;
      }

      Tasks.await(
          firebaseUser.sendEmailVerification(
              PigeonParser.getActionCodeSettings(actionCodeSettings)));
      result.success(null);
    } catch (Exception e) {
      result.error(e);
    }
  }

  @Override
  public void unlink(
      @NonNull GeneratedAndroidFirebaseAuth.PigeonFirebaseApp app,
      @NonNull String providerId,
      @NonNull
          GeneratedAndroidFirebaseAuth.Result<GeneratedAndroidFirebaseAuth.PigeonUserCredential>
              result) {
    try {
      FirebaseUser firebaseUser = getCurrentUserFromPigeon(app);

      if (firebaseUser == null) {
        result.error(FlutterFirebaseAuthPluginException.noUser());
        return;
      }

      AuthResult authResult = Tasks.await(firebaseUser.unlink(providerId));
      result.success(PigeonParser.parseAuthResult(authResult));

    } catch (ExecutionException e) {
      // If the provider ID was not found an ExecutionException is thrown.
      // On web, this is automatically handled, so we catch the specific exception here
      // to ensure consistency.
      result.error(FlutterFirebaseAuthPluginException.noSuchProvider());
    } catch (Exception e) {
      result.error(e);
    }
  }

  @Override
  public void updateEmail(
      @NonNull GeneratedAndroidFirebaseAuth.PigeonFirebaseApp app,
      @NonNull String newEmail,
      @NonNull
          GeneratedAndroidFirebaseAuth.Result<GeneratedAndroidFirebaseAuth.PigeonUserDetails>
              result) {
    try {
      FirebaseUser firebaseUser = getCurrentUserFromPigeon(app);

      if (firebaseUser == null) {
        result.error(FlutterFirebaseAuthPluginException.noUser());
        return;
      }

      Tasks.await(firebaseUser.updateEmail(newEmail));
      Tasks.await(firebaseUser.reload());
      result.success(PigeonParser.parseFirebaseUser(firebaseUser));
    } catch (Exception e) {
      result.error(e);
    }
  }

  @Override
  public void updatePassword(
      @NonNull GeneratedAndroidFirebaseAuth.PigeonFirebaseApp app,
      @NonNull String newPassword,
      @NonNull
          GeneratedAndroidFirebaseAuth.Result<GeneratedAndroidFirebaseAuth.PigeonUserDetails>
              result) {
    try {
      FirebaseUser firebaseUser = getCurrentUserFromPigeon(app);

      if (firebaseUser == null) {
        result.error(FlutterFirebaseAuthPluginException.noUser());
        return;
      }

      Tasks.await(firebaseUser.updatePassword(newPassword));
      Tasks.await(firebaseUser.reload());
      result.success(PigeonParser.parseFirebaseUser(firebaseUser));
    } catch (Exception e) {
      result.error(e);
    }
  }

  @Override
  public void updatePhoneNumber(
      @NonNull GeneratedAndroidFirebaseAuth.PigeonFirebaseApp app,
      @NonNull Map<String, Object> input,
      @NonNull
          GeneratedAndroidFirebaseAuth.Result<GeneratedAndroidFirebaseAuth.PigeonUserDetails>
              result) {
    try {
      FirebaseUser firebaseUser = getCurrentUserFromPigeon(app);

      if (firebaseUser == null) {
        result.error(FlutterFirebaseAuthPluginException.noUser());
        return;
      }

      PhoneAuthCredential phoneAuthCredential =
          (PhoneAuthCredential) PigeonParser.getCredential(input);

      if (phoneAuthCredential == null) {
        result.error(FlutterFirebaseAuthPluginException.invalidCredential());
        return;
      }

      Tasks.await(firebaseUser.updatePhoneNumber(phoneAuthCredential));
      Tasks.await(firebaseUser.reload());
      result.success(PigeonParser.parseFirebaseUser(firebaseUser));
    } catch (Exception e) {
      result.error(e);
    }
  }

  @Override
  public void updateProfile(
      @NonNull GeneratedAndroidFirebaseAuth.PigeonFirebaseApp app,
      @NonNull GeneratedAndroidFirebaseAuth.PigeonUserProfile profile,
      @NonNull
          GeneratedAndroidFirebaseAuth.Result<GeneratedAndroidFirebaseAuth.PigeonUserDetails>
              result) {
    try {
      FirebaseUser firebaseUser = getCurrentUserFromPigeon(app);

      if (firebaseUser == null) {
        result.error(FlutterFirebaseAuthPluginException.noUser());
        return;
      }

      UserProfileChangeRequest.Builder builder = new UserProfileChangeRequest.Builder();

      if (profile.getDisplayNameChanged()) {
        builder.setDisplayName(profile.getDisplayName());
      }

      if (profile.getPhotoUrlChanged()) {
        if (profile.getPhotoUrl() != null) {
          builder.setPhotoUri(Uri.parse(profile.getPhotoUrl()));
        } else {
          builder.setPhotoUri(null);
        }
      }

      Tasks.await(firebaseUser.updateProfile(builder.build()));
      Tasks.await(firebaseUser.reload());
      result.success(PigeonParser.parseFirebaseUser(firebaseUser));
    } catch (Exception e) {
      result.error(e);
    }
  }

  @Override
  public void verifyBeforeUpdateEmail(
      @NonNull GeneratedAndroidFirebaseAuth.PigeonFirebaseApp app,
      @NonNull String newEmail,
      @Nullable GeneratedAndroidFirebaseAuth.PigeonActionCodeSettings actionCodeSettings,
      @NonNull GeneratedAndroidFirebaseAuth.Result<Void> result) {
    try {
      FirebaseUser firebaseUser = getCurrentUserFromPigeon(app);

      if (firebaseUser == null) {
        result.error(FlutterFirebaseAuthPluginException.noUser());
        return;
      }

      if (actionCodeSettings == null) {
        Tasks.await(firebaseUser.verifyBeforeUpdateEmail(newEmail));
        result.success(null);
        return;
      }

      Tasks.await(
          firebaseUser.verifyBeforeUpdateEmail(
              newEmail, PigeonParser.getActionCodeSettings(actionCodeSettings)));
      result.success(null);
    } catch (Exception e) {
      result.error(e);
    }
  }
}
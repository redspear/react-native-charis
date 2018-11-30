
package com.reactlibrary;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
// import com.facebook.react.bridge.Callback;
import com.facebook.react.bridge.Promise;

import java.io.RandomAccessFile;


public class RNCharisDecodeModule extends ReactContextBaseJavaModule {

  private final ReactApplicationContext reactContext;

  public RNCharisDecodeModule(ReactApplicationContext reactContext) {
    super(reactContext);
    this.reactContext = reactContext;
  }

  @Override
  public String getName() {
    return "RNCharisDecode";
  }

  @ReactMethod
  public void decodeLesson(String path, Promise promise) {
    // String resolved = normalizePath(path);
    // if(resolved != null)
    //     path = resolved;

    try {
      System.out.print("Hello "); 
      int n = 4;
      byte[] firstBytes = new byte[n];
      byte[] lastBytes = new byte[n];

      // File file = new File(path);
      RandomAccessFile raf = new RandomAccessFile(path, "rw");

      // Seek to start of file
      raf.seek(0);
      // Read it out.
      raf.read(firstBytes);

      // // Seek to the end of file
      raf.seek(raf.length() - n);
      // // Read it out.
      raf.read(lastBytes);

      // // Write firstBytes to end
      raf.write(firstBytes);
      // // Write lastBytes to start
      raf.seek(0);
      raf.write(lastBytes);

      // // Close
      raf.close();
      promise.resolve(firstBytes.toString());
    }
    catch(Exception err) {
        System.out.print("Hello ");
        promise.reject("EUNSPECIFIED", err);
    }
    
    // byte[] buffer = new byte[4];
    // InputStream is = new FileInputStream("somwhere.in.the.dark");
    // if (is.read(buffer) != buffer.length) { 
    //     System.out.print("Hello "); 
    // }
    // is.close();
    // at this point, the buffer contains the 4 bytes...

    // [B@947e3af lastBytes
  }
}
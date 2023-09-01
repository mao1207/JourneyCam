using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Gyro : MonoBehaviour
{
    GameObject cameraContainer;
    Gyroscope gyro;
    private Quaternion rot;

    void Start()
    {
        cameraContainer = new GameObject("Camera Container");
        cameraContainer.transform.position = transform.position;
        transform.SetParent(cameraContainer.transform);
        cameraContainer.transform.rotation = Quaternion.Euler(90f, 180f, 0);

        gyro = Input.gyro;
        gyro.enabled = true;
        
        rot = new Quaternion(0, 0, 1, 0);

        NativeAPI.sendMessageToMobileApp("clearOverview: 0");
    }

    void Update()
    {
        transform.localRotation = gyro.attitude * rot;
    }
}

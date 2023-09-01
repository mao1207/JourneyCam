using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Accelerometer : MonoBehaviour
{
    Gyroscope gyro;
    private Vector3 gravity = new Vector3(0, -0.99f, 0);

    private void Start()
    {
        gyro = Input.gyro;
        gyro.enabled = true;
    }
    
    private void Update()
    {
        Quaternion rotation = Quaternion.Euler(90f, 180f, 0) * gyro.attitude * new Quaternion(0, 0, 1, 0);
        Quaternion inverseRotation = Quaternion.Inverse(rotation);
        Vector3 accelerationWithGravity = Input.acceleration;
        Vector3 inversedGravity = inverseRotation * gravity;
        inversedGravity.z = -inversedGravity.z;
        Vector3 accelerationWithoutGravity = accelerationWithGravity - inversedGravity;
        Debug.Log("WithGravity:");
        Debug.Log(accelerationWithGravity);
        Debug.Log("WithoutGravity:");
        Debug.Log(accelerationWithoutGravity);
        Debug.Log("gravity:");
        Debug.Log(inversedGravity);

        Vector3 dir = Vector3.zero;
        dir.x = accelerationWithoutGravity.x;
        dir.y = accelerationWithoutGravity.y;
        dir.z = -accelerationWithoutGravity.z;

        transform.Translate(dir);
    }
}

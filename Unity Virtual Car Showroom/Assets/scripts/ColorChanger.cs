using UnityEngine;
using UnityEngine.UI; // Include the UI namespace to work with UI elements.

public class ColorChanger : MonoBehaviour
{
    public GameObject idr_body; // Assign this in the inspector with your cube.

    // This function will be called by the buttons.
    public void ChangeCubeColor(string color)
    {
        switch (color)
        {
            case "red":
                idr_body.GetComponent<Renderer>().material.color = Color.red;
                break;
            case "green":
                idr_body.GetComponent<Renderer>().material.color = Color.green;
                break;
            case "black":
                idr_body.GetComponent<Renderer>().material.color = Color.black;
                break;
            default:
                Debug.LogError("Invalid color choice");
                break;
        }
    }
}

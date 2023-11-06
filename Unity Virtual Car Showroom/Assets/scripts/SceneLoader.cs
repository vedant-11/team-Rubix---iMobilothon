using UnityEngine;
using UnityEngine.SceneManagement;

public class SceneLoader : MonoBehaviour
{
    
    public void LoadPoloScene()
    {
        SceneManager.LoadScene("polo");
    }

    
    public void LoadWrcScene()
    {
        SceneManager.LoadScene("wrc");
    }

   
    public void LoadVanScene()
    {
        SceneManager.LoadScene("van");
    }

    public void LoadIdrScene()
    {
        SceneManager.LoadScene("idr");
    }

       public void LoadPassatScene()
    {
        SceneManager.LoadScene("passat");
    }
}

import javafx.scene.image.ImageView;

import javax.swing.*;
import java.awt.*;

/**
 * Created by TongyuYue on 2017/2/23.
 */
public class MainFrame extends JFrame {
    public MainFrame() throws HeadlessException {
        JButton transferButton = new JButton("Transfer");
        JButton addImageButton = new JButton("Add Image");
        add(transferButton,"Center");
        add(addImageButton,"Center");

    }
}

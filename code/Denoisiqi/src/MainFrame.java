import NoiseRemover.NoiseRemover;

import javax.swing.*;
import javax.swing.filechooser.FileNameExtensionFilter;
import java.awt.*;
import java.io.File;
import java.util.ArrayList;

/**
 * Created by TongyuYue on 2017/2/23.
 */
public class MainFrame extends JFrame {
    private JPanel buttonPanel;
    private JPanel imagePanel;
    private JButton transferButton;
    private JButton addImageButton;
    private JLabel oriLabel;
    private JLabel rstLabel;
    private ImageIcon oriImage;
    private ImageIcon rstImage;
    private String oriPath;
    private String[] strs = new String[]{"gray01re.jpg", "gray09re.jpg"};

    public MainFrame() throws HeadlessException {
        buttonPanel = new JPanel(new FlowLayout());
        imagePanel = new JPanel(new FlowLayout(FlowLayout.CENTER, 60, 60));
        transferButton = new JButton("Transfer");
        addImageButton = new JButton("Add Image");
        oriLabel = new JLabel();
        rstLabel = new JLabel();
        oriImage = new ImageIcon("D:\\picture\\logo.png");
        rstImage = new ImageIcon("D:\\picture\\taiji.png");
        oriImage.setImage(scaleImage(oriImage, 512));
        rstImage.setImage(scaleImage(rstImage, 512));

        oriLabel.setIcon(oriImage);
        rstLabel.setIcon(rstImage);

        imagePanel.add(oriLabel);
        imagePanel.add(rstLabel);

        addImageButton.addActionListener(e -> {
            JFileChooser chooser = new JFileChooser("D:\\");
            chooser.setDialogTitle("Please choose an image");
            chooser.setMultiSelectionEnabled(true);
            FileNameExtensionFilter filter = new FileNameExtensionFilter("jpg", "jpg");
            chooser.setFileFilter(filter);
            chooser.showOpenDialog(null);
            File file = chooser.getSelectedFile();
            oriPath = file.getAbsolutePath();
            oriImage = new ImageIcon(oriPath);
            oriImage.setImage(scaleImage(oriImage, 512));
            oriLabel.setIcon(oriImage);
        });

        transferButton.addActionListener(e -> {
//            rstImage = oriImage;
//            rstLabel.setIcon(rstImage);
//            JFileChooser chooser = new JFileChooser("D:\\temp");
//            chooser.setDialogTitle("Please choose an image");
//            chooser.setMultiSelectionEnabled(true);
//            FileNameExtensionFilter filter = new FileNameExtensionFilter("jpg", "jpg");
//            chooser.setFileFilter(filter);
//            chooser.showOpenDialog(null);
//            File file = chooser.getSelectedFile();
//            rstImage = new ImageIcon(file.getAbsolutePath());
//            com.mathworks.toolbox.javabuilder.MWArray[] args = new com.mathworks.toolbox.javabuilder.MWArray[2];
//            args[0] = new com.mathworks.toolbox.javabuilder.MWArray(oriPath);
            java.util.List lhs = new ArrayList(1);
            java.util.List rhs = new ArrayList(1);
            rhs.add(new com.mathworks.toolbox.javabuilder.MWCharArray(oriPath));
            try {
                NoiseRemover Zaoyi = new NoiseRemover();
                Zaoyi.RemovalNoise(lhs, rhs);
                rstImage = new ImageIcon("d:\\result.jpg");
                rstImage.setImage(MainFrame.this.scaleImage(rstImage, 512));
                rstLabel.setIcon(rstImage);
            } catch (com .mathworks.toolbox.javabuilder.MWException kkk){

            }
        });

        buttonPanel.add(addImageButton);
        buttonPanel.add(transferButton);

        add("South", buttonPanel);
        add("North", imagePanel);
    }

    private Image scaleImage(ImageIcon img, int width) {
        return img.getImage().getScaledInstance(width, width * img.getImage().getHeight(this) / img.getImage().getWidth(this), Image.SCALE_DEFAULT);
    }
}

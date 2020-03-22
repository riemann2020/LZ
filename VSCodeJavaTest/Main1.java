import java.awt.*;
import java.util.Random;
import javax.swing.*;
import javax.swing.event.*;
import java.awt.event.*;


public class Main1 implements ActionListener {
    // 界面
    JFrame frame = new JFrame("VSCode-Java-Test1");
    private ImageIcon MYisonIcon = new ImageIcon("mylogo.png");
    private MenuItem gameNewItem = new MenuItem("New Game");

    int ROW = 9;
    int COL = 9;
    int MYison = -1;
    int[][] datagrid = new int[ROW][COL];
    JButton[][] btns = new JButton[ROW][COL];
    Container buttongrid = new Container();

    public Main1() {
        frame.setResizable(false);
        frame.setBounds(480, 170, 500, 500);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        JMenuBar menuBar = new JMenuBar();
        frame.setJMenuBar(menuBar);
        JMenu menuGame = new JMenu("Game");
        menuBar.add(menuGame);
        JMenuItem itemNew = new JMenuItem("New");
        itemNew.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
            newGame(buttongrid);
            }
        });
        menuGame.add(itemNew);

        frame.validate();

        newGame(buttongrid);
    }

    private void addMYison(int[][] datagrid) {
        Random rand = new Random();
        
        int x0 = rand.nextInt(ROW);
        int y0 = rand.nextInt(COL);
        
        for(int i=0;i<ROW;i++){
            for(int j=0;j<COL;j++){
                datagrid[i][j]=Math.max(Math.abs(i-x0),Math.abs(j-y0));
            }
        }
        if (datagrid[x0][y0] != MYison) {
            datagrid[x0][y0] = MYison;
        }

    }

    private void setButtons(Container con1) {
        con1.setLayout(new GridLayout(ROW, COL));

        for (int i = 0; i < ROW; i++) {
            for (int j = 0; j < COL; j++) {
                //JButton btn = new JButton(data[i][j] + "");
                JButton btn = new JButton();
                btn.addActionListener(this);
                btn.setBackground(new Color(136, 184, 200));
                con1.add(btn);
                btns[i][j] = btn;
            }
        }

        frame.add(con1, BorderLayout.CENTER);
    }

    private void newGame(Container buttongrid)
    {
        buttongrid.removeAll();
        addMYison();
        setButtons(buttongrid);
        frame.setVisible(true);
    }

    public static void main(String[] args) {
        new Main1();
    }

    @Override
    public void actionPerformed(ActionEvent actionEvent) {
        JButton btn = (JButton) actionEvent.getSource();
        for (int i = 0; i < ROW; i++) {
            for (int j = 0; j < COL; j++) {
                if (btn.equals(btns[i][j])) {
                    if (datagrid[i][j] == MYison) {
                        win();
                    } else {
                        open(i,j);
                    }
                    return;
                }
            }
        }
    }
    private void win() {
        for (int i = 0; i < ROW; i++) {
            for (int j = 0; j < COL; j++) {
                if (btns[i][j].isEnabled()) {
                    if (datagrid[i][j] == MYison) {
                        btns[i][j].setEnabled(false);
                        btns[i][j].setIcon(MYisonIcon);
                        btns[i][j].setDisabledIcon(MYisonIcon);
                    }
                }
            }
        }
        JOptionPane.showMessageDialog(frame,"你终于找到返回舱了！");
    }
    private void open(int i, int j) {
        JButton btn = btns[i][j];
        if (!btn.isEnabled()) return;
        btn.setIcon(null);
        btn.setEnabled(false);
        btn.setBackground(Color.white);
        btn.setText(datagrid[i][j] + "");
    }
}
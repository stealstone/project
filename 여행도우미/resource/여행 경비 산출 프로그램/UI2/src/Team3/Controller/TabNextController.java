package Team3.Controller;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Vector;

import javax.swing.JComboBox;
import javax.swing.JPanel;
import javax.swing.JTabbedPane;

@SuppressWarnings("unused")
public class TabNextController implements ActionListener {
	private JTabbedPane tab;
	private int flag;

	public TabNextController(JTabbedPane tab, int flag) {
		this.tab = tab;
		this.flag = flag;

	}

	@Override
	public void actionPerformed(ActionEvent e) {
		
		if(flag == 1){
			this.tab.setEnabledAt(0, false);
			this.tab.setEnabledAt(1, true);
			this.tab.setEnabledAt(2, false);
			this.tab.setEnabledAt(3, false);
			this.tab.setEnabledAt(4, false);
			this.tab.setEnabledAt(5, false);
			this.tab.setSelectedIndex(flag);
		}
		else if(flag == 2){
			this.tab.setEnabledAt(0, false);
			this.tab.setEnabledAt(1, false);
			this.tab.setEnabledAt(2, true);
			this.tab.setEnabledAt(3, false);
			this.tab.setEnabledAt(4, false);
			this.tab.setEnabledAt(5, false);
			this.tab.setSelectedIndex(flag);
		}
		else if(flag == 3){
			this.tab.setEnabledAt(0, false);
			this.tab.setEnabledAt(1, false);
			this.tab.setEnabledAt(2, true);
			this.tab.setEnabledAt(3, true);
			this.tab.setEnabledAt(4, true);
			this.tab.setEnabledAt(5, true);
			this.tab.setSelectedIndex(flag);
		}
		else if(flag == 4){
			this.tab.setEnabledAt(0, false);
			this.tab.setEnabledAt(1, false);
			this.tab.setEnabledAt(2, true);
			this.tab.setEnabledAt(3, true);
			this.tab.setEnabledAt(4, true);
			this.tab.setEnabledAt(5, true);
			this.tab.setSelectedIndex(flag);
		}
		else if(flag == 5){
			this.tab.setEnabledAt(0, false);
			this.tab.setEnabledAt(1, false);
			this.tab.setEnabledAt(2, true);
			this.tab.setEnabledAt(3, true);
			this.tab.setEnabledAt(4, true);
			this.tab.setEnabledAt(5, true);
			this.tab.setSelectedIndex(flag);
		}
	}

}

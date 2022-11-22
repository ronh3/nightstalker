function nightstalker.ui.update_stylesheet()
    local background_color = 'rgba(0, 20, 20, 100)'
    local background_color_lighter = 'rgba(0, 40, 40, 100)'
    local background_color_hover = 'rgba(0, 60, 60, 100)'
    local border_color = 'rgba(40, 60, 60, 100)'
    local border_color_hover = 'rgba(40, 60, 60)' 
    local font_color = '#e5ae69'
    local font_color_hover = '#faf3ea'
    local border_radius_one = '5px';
    local border_radius_two = '5px';
    local font_size_settings = '13px';
  
    -- setAppStyleSheet([[
    --   QMainWindow {
    --     background: ]]..background_color_hover..[[;
    --   }
    
    --   QToolBar {
    --     background: ]]..background_color..[[;
    --   }
      
    --   QWidget {
    --     /*font-size: ]]..font_size_settings..[[;*/
    --     color: ]]..font_color..[[;
    --     background-color: ]]..background_color..[[;
    --     selection-background-color: ]]..border_color..[[;	/* selected text bg-color */
    --     /*selection-color: #eff0f1;*/	/* selected text color */
    --     /*background-clip: border;*/
    --     /*border-image: none;*/
    --     border: 0px transparent ]]..border_color..[[;
    --     /*outline: 0;*/
    --   }
      
    --   QWidget:hover {
    --     color: ]]..font_color_hover..[[;
    --   }
  
    --   QWidget:item {
    --     background-color: ]]..background_color..[[;
    --     color: ]]..font_color_hover..[[;
    --   }
  
    --   QWidget:item:hover {
    --     background-color: ]]..background_color_hover..[[;
    --     color: ]]..font_color_hover..[[;
    --   }
      
    --   QWidget:item:selected {
    --     background-color: ]]..background_color_hover..[[;
    --   }
  
    --   QLineEdit {
    --     background-color: ]]..background_color..[[;
    --     padding: 5px;
    --     border-radius: ]]..border_radius_two..[[;
    --   }
  
    --   QLineEdit:hover,
    --   QLineEdit:focus {
    --     color: ]]..font_color..[[;
    --     background-color: ]]..background_color_hover..[[;
    --   }
      
    --   QGroupBox {
    --     border: 1px solid ]]..background_color_hover..[[;
    --     border-radius: ]]..border_radius_two..[[;
    --     margin-top: 20px;
    --   }
  
    --   QGroupBox::title {
    --     subcontrol-origin: margin;
    --     subcontrol-position: top center;
    --     padding-left: 10px;
    --     padding-right: 10px;
    --     padding-top: 10px;
    --   }
  
    -- /*  QAbstractScrollArea {
    --     border-radius: ]]..border_radius_two..[[;
    --     background-color: ]]..background_color_lighter..[[;
    --   }*/
      
  
    --   QPlainTextEdit {
    --     border-top: 1px solid ]]..border_color..[[;
    --     /*border-radius: ]]..border_radius_two..[[;*/
    --     padding: 3px 8px;
    --     background-color: rgb(0, 10, 10);
    --   }
  
    --   QSizeGrip {
    --     background-color: ]]..border_color..[[;
    --   }
  
    --   QPushButton {
    --     border-radius: ]]..border_radius_two..[[;
    --   }
  
    --   QPushButton:hover {
    --     background-color: ]]..background_color_hover..[[;
    --   }
  
    --   QPushButton:disabled {
    --     background-color: ]]..background_color_lighter..[[;
    --   }
  
  
    --   QComboBox {
    --     background-color: ]]..background_color_lighter..[[;
    --     border-radius: ]]..border_radius_two..[[;
    --     padding: 5px; 
    --   }
  
    --   QComboBox:hover,
    --   QComboBox:focus {
    --     background-color: ]]..background_color_hover..[[;
    --   }
  
    --   QSpinBox {
    --     background-color: ]]..background_color_lighter..[[;
    --     padding: 5px;
    --     border-radius: ]]..border_radius_two..[[;
    --   }
  
    --   QSpinBox:hover {
    --     background-color: ]]..background_color_hover..[[;
    --   }
  
    --   QTabWidget::pane {
    --     border: 0px solid ]]..background_color_hover..[[;
    --     /*padding: 5px;*/
    --     /*margin: 0px;*/
    --   }
  
    --   QTabWidget::tab-bar {
    --     left: 10px;	
    --   }
  
    --   QTabBar {
    --     qproperty-drawBase: 0;
    --     border-bottom: 2px solid ]]..background_color_hover..[[;
    --   }
  
    --   QTabBar::tab:top {
    --     color: ]]..font_color..[[;
    --     border: 2px solid ]]..background_color_hover..[[;
    --     background-color: ]]..background_color..[[;
    --     padding: 5px;
    --     margin-right: 5px;
    --     min-width: 50px;
    --     border-top-left-radius: ]]..border_radius_two..[[;
    --     border-top-right-radius: ]]..border_radius_two..[[;
    --   }
      
    --   QTabBar::tab:top:selected {
    --     border-bottom: 2px solid ]]..border_color..[[;
    --     background-color: ]]..background_color_hover..[[;
    --   }
  
    --   QTabBar::tab:top:!selected:hover {
    --     color: ]]..font_color_hover..[[;
    --     background-color: ]]..background_color_hover..[[;
    --   }
  
    --   QListView {
    --     background-color: ]]..background_color_lighter..[[;
    --     padding: 5px;
    --     border-radius: ]]..border_radius_two..[[;
    --   }
  
    --   QListView::item {
    --     background-color: ]]..background_color_lighter..[[;
    --     color: ]]..font_color..[[;
    --     border-radius: ]]..border_radius_two..[[;
    --     margin: 2px;
    --   }
  
    --   QListView::item:!selected {
    --     background-color: ]]..background_color_lighter..[[;
    --     color: ]]..font_color..[[;
    --   }
  
    --   QListView::item:!selected:hover {
    --     background-color: ]]..background_color_hover..[[;
    --     color: ]]..font_color_hover..[[;
    --   }
  
    --   QToolButton {
    --     background: ]]..background_color..[[;
    --     border-style: solid;
    --     border-width: 2px;
    --     border-color: ]]..border_color..[[;
    --     border-radius: ]]..border_radius_one..[[;
    --     font-family: BigNoodleTitling;
    --     color: ]]..font_color..[[;
    --     margin: 2px;
    --     font-size: 10pt;
    --   }
      
    --   QToolButton:hover {
    --     color: ]]..font_color..[[;
    --     background: ]]..background_color_hover..[[;
    --     border-color: ]]..border_color_hover..[[;
    --     padding-top: 2px;
    --   }
      
    --   QDockWidget {
    --     color: ]]..font_color_hover..[[;
    --     background: ]]..border_color..[[;
    --   }
  
    --   QDockWidget:hover {
    --     color: ]]..font_color..[[;
    --     background: ]]..background_color_hover..[[;
    --     border-color: ]]..border_color_hover..[[;
    --     padding-top: 2px;
    --   }
  
    --   QStatusBar {
    --     background: ]]..border_color..[[;
    --     color: ]]..font_color_hover..[[;
    --   }
  
    --   QStatusBar:hover {
    --     color: ]]..font_color..[[;
    --     background: ]]..background_color_hover..[[;
    --     border-color: ]]..border_color_hover..[[;
    --     padding-top: 2px;
    --   }
  
    --   QScrollBar:vertical {
    --     background: ]]..background_color..[[;
    --     width: 15px;
    --     margin: 22px 0 22px 0;
    --   }
  
    --   QScrollBar::handle:vertical {
    --     background-color: ]]..background_color..[[;
    --     min-height: 20px;
    --     border-width: 2px;
    --     border-style: solid;
    --     border-color: ]]..border_color..[[;
    --     border-radius: 7px;
    --   }
  
    --   QScrollBar::add-line:vertical {
    --     background-color: ]]..background_color..[[;
    --     border-width: 2px;
    --     border-style: solid;
    --     border-color: ]]..border_color..[[;
    --     border-bottom-left-radius: 7px;
    --     border-bottom-right-radius: 7px;
    --     height: 15px;
    --     subcontrol-position: bottom;
    --     subcontrol-origin: margin;
    --   }
      
    --   QScrollBar::add-line:vertical:hover,
    --   QScrollBar::sub-line:vertical:hover,
    --   QScrollBar::handle:vertical:hover {
    --     border-color: ]]..border_color_hover..[[;
    --     background-color: ]]..background_color_hover..[[;
    --   }
  
    --   QScrollBar::sub-line:vertical {
    --     background-color: ]]..background_color..[[;
    --     border-width: 2px;
    --     border-style: solid;
    --     border-color: ]]..border_color..[[;
    --     border-top-left-radius: 7px;
    --     border-top-right-radius: 7px;
    --     height: 15px;
    --     subcontrol-position: top;
    --     subcontrol-origin: margin;
    --   }
  
    --   QScrollBar::up-arrow:vertical, QScrollBar::down-arrow:vertical {
    --     background: white;
    --     width: 4px;
    --     height: 3px;
    --   }
  
    --   QScrollBar::add-page:vertical, QScrollBar::sub-page:vertical {
    --     background: none;
    --   }
      
    -- /* horizontal scroll */
      
    --   QScrollBar:horizontal {
    --     background: ]]..background_color..[[;
    --     height: 25px;
    --     margin: 0 22px 10px 22px;
    --   }
      
    --   QScrollBar::handle:horizontal {
    --     background-color: ]]..background_color..[[;
    --     min-width: 20px;
    --     border-width: 2px;
    --     border-style: solid;
    --     border-color: ]]..border_color..[[;
    --     border-radius: 7px;
    --   }
      
    --   QScrollBar::add-line:horizontal {
    --     background-color: ]]..background_color..[[;
    --     border-width: 2px;
    --     border-style: solid;
    --     border-color: ]]..border_color..[[;
    --     border-top-right-radius: 7px;
    --     border-bottom-right-radius: 7px;
    --     height: 11px;
    --     width: 15px;
    --     subcontrol-position: right;
    --     subcontrol-origin: margin;
    --     margin-bottom: 10px;
    --   }
      
    --   QScrollBar::sub-line:horizontal {
    --     background-color: ]]..background_color..[[;
    --     border-width: 2px;
    --     border-style: solid;
    --     border-color: ]]..border_color..[[;
    --     border-top-left-radius: 7px;
    --     border-bottom-left-radius: 7px;
    --     height: 11px;
    --     width: 15px;
    --     subcontrol-position: left;
    --     subcontrol-origin: margin;
    --     margin-bottom: 10px;
    --   }
      
    --   QScrollBar::add-line:horizontal:hover,
    --   QScrollBar::sub-line:horizontal:hover,
    --   QScrollBar::handle:horizontal:hover {
    --     border-color: ]]..border_color_hover..[[;
    --     background-color: ]]..background_color_hover..[[;
    --   }
      
    --   QScrollBar::add-page:horizontal, QScrollBar::sub-page:horizontal {
    --     background: none;
    --   }
    -- ]])
  end
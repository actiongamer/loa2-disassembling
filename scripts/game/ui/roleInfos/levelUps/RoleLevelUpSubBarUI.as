package game.ui.roleInfos.levelUps
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.ProgressBar;
   import morn.core.components.List;
   import morn.core.components.Button;
   import game.ui.commons.icons.WealthRenderS7UI;
   
   public class RoleLevelUpSubBarUI extends View
   {
      
      protected static var uiView:XML = <View width="473" height="109">
			  <Image skin="png.a5.commonImgs.分割透明底" y="5"/>
			  <Label text="Lv.88" autoSize="center" stroke="0x0" var="txt_levelNow" letterSpacing="1" align="center" x="52" y="10" style="普通说明"/>
			  <Box x="131" y="12" width="272.40000000000003" height="18">
			    <ProgressBar skin="png.a5.comps.progresses.progress_S9" var="bar_levelExp" sizeGrid="5,0,12,0" x="-4" y="1"/>
			    <Label text="0/140" stroke="0x0" letterSpacing="1" var="txt_exp" x="12.2" height="18" align="center" autoSize="none" centerX="0.5" width="249" isHtml="true" y="0" style="普通说明"/>
			    <Label text="获得经验：65530" stroke="0x0" letterSpacing="1" x="80" height="18" align="center" autoSize="center" var="txt_canAwardExp" y="0" style="普通说明"/>
			  </Box>
			  <Label text="+1" autoSize="none" stroke="0x0" var="txt_levelPre" letterSpacing="1" x="92" y="10" width="28" height="18" style="重要提示绿"/>
			  <List repeatX="4" spaceX="23" var="list_item" buttonMode="true" x="129" y="39">
			    <WealthRenderS7 x="0" y="0" name="render" runtime="game.ui.commons.icons.WealthRenderS7UI"/>
			  </List>
			  <Button label="\l30100004\l" stateNum="1" buttonMode="true" x="135" y="119.5" labelBold="false" var="btn_levelUp" style="按钮大绿"/>
			  <Label text="\l30100009" stroke="0x0" letterSpacing="1" x="134" y="157" style="下划线黄色" width="158" align="center" visible="false"/>
			  <Button label="\l30100004\l" stateNum="1" buttonMode="true" x="296" y="119.5" labelBold="false" var="btn_levelUp10" style="按钮大黄"/>
			</View>;
       
      
      public var txt_levelNow:Label = null;
      
      public var bar_levelExp:ProgressBar = null;
      
      public var txt_exp:Label = null;
      
      public var txt_canAwardExp:Label = null;
      
      public var txt_levelPre:Label = null;
      
      public var list_item:List = null;
      
      public var btn_levelUp:Button = null;
      
      public var btn_levelUp10:Button = null;
      
      public function RoleLevelUpSubBarUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRenderS7UI"] = WealthRenderS7UI;
         super.createChildren();
         createView(uiView);
      }
   }
}

package game.ui.petModule.levelUp
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.ProgressBar;
   import morn.core.components.Button;
   import game.ui.horseModules.horseMaster.HorseMasterHadRenderUI;
   
   public class PetLevelUpSubBarUI extends View
   {
      
      protected static var uiView:XML = <View width="473" height="109">
			  <Image skin="png.uiPet.img_levelUpBottom" x="-2" y="1"/>
			  <Label text="Lv.88" autoSize="center" stroke="0x0" var="txt_levelNow" letterSpacing="1" align="center" x="7" y="19" style="普通说明"/>
			  <Box x="63" y="19" width="409.40000000000003" height="18">
			    <ProgressBar skin="png.a5.comps.progresses.progress_S9" var="bar_levelExp" sizeGrid="5,0,0,0" x="-4" y="1" width="414" height="15"/>
			    <Label text="0/140" stroke="0x0" letterSpacing="1" var="txt_exp" x="12.2" height="18" align="center" autoSize="none" centerX="0.5" width="249" isHtml="true" y="0" style="普通说明"/>
			    <Label text="获得经验：65530" stroke="0x0" letterSpacing="1" x="150.2" height="18" align="center" autoSize="center" var="txt_canAwardExp" y="0" style="普通说明"/>
			  </Box>
			  <Label text="+1" autoSize="none" stroke="0x0" var="txt_levelPre" letterSpacing="1" x="42" y="19" width="28" height="18" style="重要提示绿"/>
			  <Button label="\l30100004\l" stateNum="1" buttonMode="true" x="113" y="46" labelBold="false" var="btn_levelUp" style="按钮大绿"/>
			  <Button label="\l30100004\l" stateNum="1" buttonMode="true" x="298" y="46" labelBold="false" var="btn_levelUp10" style="按钮大黄"/>
			  <HorseMasterHadRender x="146" y="88" var="renderHad" runtime="game.ui.horseModules.horseMaster.HorseMasterHadRenderUI"/>
			</View>;
       
      
      public var txt_levelNow:Label = null;
      
      public var bar_levelExp:ProgressBar = null;
      
      public var txt_exp:Label = null;
      
      public var txt_canAwardExp:Label = null;
      
      public var txt_levelPre:Label = null;
      
      public var btn_levelUp:Button = null;
      
      public var btn_levelUp10:Button = null;
      
      public var renderHad:HorseMasterHadRenderUI = null;
      
      public function PetLevelUpSubBarUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.horseModules.horseMaster.HorseMasterHadRenderUI"] = HorseMasterHadRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}

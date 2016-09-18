package game.ui.lvlUpModules
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.Button;
   
   public class FunctionListRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="338" height="84">
			  <Image skin="png.uiLvlUpModule.选中效果" x="0" y="0" var="img_selected"/>
			  <Image skin="png.a5.commonImgs.线" x="-16" y="82"/>
			  <Image skin="png.uiLvlUpModule.图标" x="45" y="43" anchorX=".5" anchorY=".5" var="img_iocn" width="60" height="60" smoothing="true"/>
			  <Label text="加底标题加底标题" autoSize="left" x="80" y="11" style="加底标题" var="txt_name"/>
			  <Label text="加底标题加底标题加底标题加底标题加底标题加底标题加底标题加底标题加底标题加底标题加底标题加底标题加底标题加底标题加底标题加底标题加底标题加底标题加底标题加底标题加底标题加底标题加底标题加底标题加底标题加底标题加底标题加底标题加底标题加底标题加底标题加底标题题加底标题加底标题加底标题" autoSize="none" x="80" y="33" style="普通说明" width="174" height="42" wordWrap="true" multiline="true" var="txt_des"/>
			  <Button skin="png.uiLvlUpModule.btn_go" x="255" y="25" stateNum="1" var="btn_go"/>
			  <Label text="32级开启" x="264" y="36" style="不足禁止红" var="txt_needLvl" multiline="true" wordWrap="true" width="65" language="en" lgx="264,264" lgy="24,36"/>
			  <Image skin="png.uiLvlUpModule.开启" x="-11" y="-14" var="img_open"/>
			</View>;
       
      
      public var img_selected:Image = null;
      
      public var img_iocn:Image = null;
      
      public var txt_name:Label = null;
      
      public var txt_des:Label = null;
      
      public var btn_go:Button = null;
      
      public var txt_needLvl:Label = null;
      
      public var img_open:Image = null;
      
      public function FunctionListRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         createView(uiView);
      }
   }
}

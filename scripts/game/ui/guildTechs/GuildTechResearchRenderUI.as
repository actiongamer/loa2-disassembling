package game.ui.guildTechs
{
   import morn.core.components.View;
   import morn.core.components.Button;
   import morn.core.components.Label;
   import morn.core.components.Image;
   
   public class GuildTechResearchRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="364" height="76">
			  <Image skin="png.a5.bgs.listRenderBgs.renderBgS5" x="-2" y="-2" sizeGrid="16,16,16,16" width="344" height="80"/>
			  <Button label="研  究" x="250" y="27" style="按钮中绿" var="btn_get"/>
			  <Label text="生命 LV1" autoSize="none" x="72" y="13" style="小标题" width="178" height="21" var="txt_tip" multiline="true" size="14"/>
			  <Image skin="png.a5.comps.img_block" x="38" y="38" anchorX="0.5" anchorY="0.5" var="img_icon" autoSize="true"/>
			  <Label text="下级效果" autoSize="none" x="71" y="41" style="小标题" width="179" height="23" var="txt_tip2" multiline="true" size="14"/>
			  <Label text="生命 LV1" autoSize="none" x="141" y="29" style="普通说明" width="192" height="21" var="txt_cd" multiline="true" size="14" align="right"/>
			</View>;
       
      
      public var btn_get:Button = null;
      
      public var txt_tip:Label = null;
      
      public var img_icon:Image = null;
      
      public var txt_tip2:Label = null;
      
      public var txt_cd:Label = null;
      
      public function GuildTechResearchRenderUI()
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

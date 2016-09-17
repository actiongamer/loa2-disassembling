package game.ui.dungeonScene
{
   import morn.core.components.View;
   import morn.core.components.Box;
   import morn.core.components.Image;
   import game.ui.commons.icons.SkillRenderS6UI;
   import morn.core.components.Label;
   
   public class NewEnemyComeUI extends View
   {
      
      protected static var uiView:XML = <View>
			  <Box centerX="0" centerY="0" var="box_info" width="1013">
			    <Image skin="png.uiNewEnemy.newEnemy.img_new_bg" var="img_bg" centerX="0" anchorX=".5"/>
			    <Image skin="png.uiNewEnemy.newEnemy.img_di" var="img_sbg" anchorX=".5" anchorY=".5" x="305" y="228"/>
			    <Image skin="png.uiNewEnemy.newEnemy.img_down_Line" x="450" y="280" var="img_down_line"/>
			    <Image skin="png.uiNewEnemy.newEnemy.img_up_line" x="409" y="97" var="img_up_line"/>
			    <Image skin="png.uiNewEnemy.newEnemy.img_line" x="550" y="152" var="img_line"/>
			    <Image skin="png.uiNewEnemy.newEnemy.img_bar" x="550" y="233" var="img_bar1"/>
			    <Image skin="png.uiNewEnemy.newEnemy.img_bar" x="550" y="356" var="img_bar2"/>
			    <SkillRenderS6 x="558" y="299" var="skill_info" runtime="game.ui.commons.icons.SkillRenderS6UI"/>
			    <Image skin="png.comp.image" x="303" y="254" anchorX=".5" anchorY=".5" var="img_face"/>
			    <Box x="574" y="169" var="img_info">
			      <Image skin="png.uiNewEnemy.newEnemy.img_dot" y="5"/>
			      <Label text="品质" autoSize="none" x="16" style="普通说明" size="14"/>
			      <Image skin="png.uiNewEnemy.newEnemy.img_dot" y="40"/>
			      <Label text="简介" autoSize="none" x="16" y="35" style="普通说明" size="14"/>
			      <Label text="绿色" autoSize="none" x="87" style="普通绿色" size="14" var="txt_qulity"/>
			      <Label text="普通绿色" autoSize="none" x="85" y="35" style="技能名标题" size="14" width="289" height="69" var="txt_info" multiline="true" wordWrap="true"/>
			    </Box>
			    <Label text="\l30100016" autoSize="none" x="432" y="451" style="加底标题" width="194" height="20" align="center" var="txt_gotip"/>
			    <Box x="573" y="43" var="box_name">
			      <Label text="闪电幽魂" autoSize="none" style="普通绿色" size="50" width="456" height="65" align="left" var="txt_name" x="1"/>
			      <Image skin="png.comp.image" y="65" var="img_group" width="38" height="39"/>
			      <Label text="品质" autoSize="none" x="46" style="普通说明" size="18" y="70" width="155" height="30" var="txt_group"/>
			    </Box>
			  </Box>
			  <Image skin="png.uiNewEnemy.newEnemy.img_new_hero" x="263" y="120" right="0" top="200" var="img_new"/>
			</View>;
       
      
      public var box_info:Box = null;
      
      public var img_bg:Image = null;
      
      public var img_sbg:Image = null;
      
      public var img_down_line:Image = null;
      
      public var img_up_line:Image = null;
      
      public var img_line:Image = null;
      
      public var img_bar1:Image = null;
      
      public var img_bar2:Image = null;
      
      public var skill_info:SkillRenderS6UI = null;
      
      public var img_face:Image = null;
      
      public var img_info:Box = null;
      
      public var txt_qulity:Label = null;
      
      public var txt_info:Label = null;
      
      public var txt_gotip:Label = null;
      
      public var box_name:Box = null;
      
      public var txt_name:Label = null;
      
      public var img_group:Image = null;
      
      public var txt_group:Label = null;
      
      public var img_new:Image = null;
      
      public function NewEnemyComeUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.SkillRenderS6UI"] = SkillRenderS6UI;
         super.createChildren();
         createView(uiView);
      }
   }
}

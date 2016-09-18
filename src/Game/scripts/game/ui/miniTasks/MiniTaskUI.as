package game.ui.miniTasks
{
   import morn.customs.components.StaticModuleView;
   import morn.core.components.Box;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import game.ui.commons.icons.WealthRenderS14UI;
   
   public class MiniTaskUI extends StaticModuleView
   {
      
      protected static var uiView:XML = <StaticModuleView width="187" buttonMode="false" height="70">
			  <Box var="box_content" x="-73" y="-31" buttonMode="true">
			    <Image skin="png.uiMiniTask.主界面任务" var="img_bg"/>
			    <Label text="5/5" autoSize="left" x="141" y="67" style="普通说明" align="left" var="txt_progress" mouseEnabled="false" mouseChildren="false" language="en" lgx="141,141" lgy="75,75"/>
			    <Label text="任务名字任务名字任务名字任务名字任务名字" autoSize="left" x="141" y="40" style="重要提示橘黄" align="left" var="txt_title" size="12" width="119" mouseChildren="false" mouseEnabled="false" multiline="true" wordWrap="true" leading="2" underline="true"/>
			    <WealthRenderS14 var="iconRender" x="79" y="38" runtime="game.ui.commons.icons.WealthRenderS14UI"/>
			    <Label text="当前没有新的任务当前没有新的任务当前没有新的任务" autoSize="left" x="75" y="46" style="普通说明" align="center" var="txt_empty" size="12" width="181" height="44" mouseChildren="false" mouseEnabled="false" multiline="true" wordWrap="true" leading="2" underline="false"/>
			    <Label text="进度：5/5" autoSize="left" x="184" y="67" style="普通说明" align="left" var="txt_des" mouseEnabled="false" mouseChildren="false" underline="true" visible="false"/>
			    <Label text="主线任务" x="77" y="19" style="渐变1" align="center" mouseEnabled="false" mouseChildren="false" underline="false" size="14" width="59" height="20" visible="false"/>
			  </Box>
			  <Image skin="png.uiMiniTask.img_light" x="-30" y="-42" rotation="90" width="491" height="517" alpha="0.3" scale="0.3" var="img_light"/>
			</StaticModuleView>;
       
      
      public var box_content:Box = null;
      
      public var img_bg:Image = null;
      
      public var txt_progress:Label = null;
      
      public var txt_title:Label = null;
      
      public var iconRender:WealthRenderS14UI = null;
      
      public var txt_empty:Label = null;
      
      public var txt_des:Label = null;
      
      public var img_light:Image = null;
      
      public function MiniTaskUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRenderS14UI"] = WealthRenderS14UI;
         super.createChildren();
         createView(uiView);
      }
   }
}

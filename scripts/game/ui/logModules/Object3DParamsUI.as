package game.ui.logModules
{
   import morn.core.components.View;
   import morn.core.components.List;
   import morn.core.components.Label;
   import morn.core.components.Button;
   import nslm2.common.ui.components.debug3d.Param3DRender;
   
   public class Object3DParamsUI extends View
   {
      
      protected static var uiView:XML = <View width="320" height="100" name="render">
			  <GRect fillAlpha="0.8" radius="0,0,0,0" lineAlpha="1" x="0" y="0" width="320" height="100" lineThickness="2" lineColor="0x009999" fillColor="0xFFFFFF"/>
			  <List x="76" y="24" repeatX="3" repeatY="3" var="list_params">
			    <Param3DRender name="render" runtime="nslm2.common.ui.components.debug3d.Param3DRender"/>
			  </List>
			  <Label text="Position" autoSize="left" x="7" y="25" size="14" color="0xFFFF00" var="btn_position" width="59" height="24"/>
			  <Label text="Rotation" autoSize="left" x="7" y="49" size="14" color="0x00FF00" var="btn_rotation" height="24"/>
			  <Label text="Scale" autoSize="left" x="15" y="72" size="14" color="0xF99FF0" var="btn_scale" height="24"/>
			  <Label text="Position" autoSize="left" x="1" y="1" size="14" color="0x9966ff" var="txt_name" width="298" height="20"/>
			  <Button label="刷新" stateNum="3" buttonMode="true" skin="png.comp.button" x="281" y="1" right="1" width="38" height="23" var="btn_refresh"/>
			</View>;
       
      
      public var list_params:List = null;
      
      public var btn_position:Label = null;
      
      public var btn_rotation:Label = null;
      
      public var btn_scale:Label = null;
      
      public var txt_name:Label = null;
      
      public var btn_refresh:Button = null;
      
      public function Object3DParamsUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["nslm2.common.ui.components.debug3d.Param3DRender"] = Param3DRender;
         super.createChildren();
         createView(uiView);
      }
   }
}

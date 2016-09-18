package nslm2.modules.dungeons.scripts
{
   import flash.geom.Point;
   import flash.display.DisplayObject;
   import nslm2.modules.dungeons.scripts.comps.ScriptCmdEffect3DView;
   import away3d.containers.ObjectContainer3D;
   import morn.core.components.Component;
   import nslm2.modules.fightPlayer.UnitView;
   
   public interface IScriptBox
   {
       
      
      function get isBossBattle() : Boolean;
      
      function get cameraX() : int;
      
      function set cameraX(param1:int) : void;
      
      function get anchorPoi() : Point;
      
      function getUnitById(param1:String) : Array;
      
      function addDisplay2D(param1:String, param2:DisplayObject) : void;
      
      function getDisplay2DById(param1:String) : DisplayObject;
      
      function deleteDisplay2D(param1:String) : void;
      
      function addDisplay3D(param1:String, param2:String, param3:ObjectContainer3D = null) : ScriptCmdEffect3DView;
      
      function getDisplay3DById(param1:String) : ScriptCmdEffect3DView;
      
      function deleteDisplay3D(param1:String) : void;
      
      function get topLayer2D() : Component;
      
      function createTempUnitByNpcId(param1:int, param2:String, param3:String, param4:int, param5:int, param6:int) : UnitView;
      
      function deleteUnit(param1:String) : void;
   }
}

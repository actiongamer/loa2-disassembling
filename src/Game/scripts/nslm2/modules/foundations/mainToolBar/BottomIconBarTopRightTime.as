package nslm2.modules.foundations.mainToolBar
{
   import proto.FunctionActionInfo;
   
   public class BottomIconBarTopRightTime extends BottomIconBarTopRight
   {
       
      
      private var _localDataKey:String = "time";
      
      public function BottomIconBarTopRightTime()
      {
         super();
      }
      
      override public function getNewRender() : BottomIconRenderTopRight
      {
         return new BottomIconRenderTopRightTime();
      }
      
      override public function getId(param1:Array, param2:int) : int
      {
         var _loc3_:FunctionActionInfo = param1[param2];
         return _loc3_.funcid;
      }
      
      override protected function get key() : String
      {
         return "bottomIconTopRight" + _localDataKey;
      }
   }
}

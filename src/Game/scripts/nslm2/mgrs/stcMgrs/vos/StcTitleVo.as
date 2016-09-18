package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   import morn.core.utils.StringUtils;
   
   public class StcTitleVo extends StcVoBase
   {
      
      public static const PLATFORM:String = "platform";
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_title";
       
      
      private var _offsetArr:Array;
      
      public var id:int;
      
      public var titlename:int;
      
      public var titilekind:int;
      
      public var titlequality:String;
      
      public var activeId:int;
      
      public var describe:String;
      
      public var titileicon:int;
      
      public var validity:int;
      
      public var platform:String;
      
      public var attribute:String;
      
      public var isEffect:int;
      
      public var offset:String;
      
      public function StcTitleVo()
      {
         super();
      }
      
      public function get offsetY() : int
      {
         if(_offsetArr == null)
         {
            if(StringUtils.isNull(this.offset) == false)
            {
               _offsetArr = offset.split(",");
            }
            else
            {
               _offsetArr = [0,0];
            }
         }
         return _offsetArr[1];
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         titlename = param1[1];
         titilekind = param1[2];
         titlequality = param1[3];
         activeId = param1[4];
         describe = param1[5];
         titileicon = param1[6];
         validity = param1[7];
         platform = param1[8];
         attribute = param1[9];
         isEffect = param1[10];
         offset = param1[11];
      }
   }
}

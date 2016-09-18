package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   import com.mz.core.utils.ArrayUtil;
   
   public class StcSysNoticeVo extends StcVoBase
   {
      
      public static const SHOW_POS1:int = 1;
      
      public static const SHOW_POS2:int = 2;
      
      public static const SHOW_POS3:int = 3;
      
      public static const SHOW_POS4:int = 4;
      
      public static const SHOW_POS5:int = 5;
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_sys_notice";
       
      
      private var _showArr:Array;
      
      public var id:int;
      
      public var text:String;
      
      public var show:String;
      
      public var condition:String;
      
      public function StcSysNoticeVo()
      {
         super();
      }
      
      public function get showArr() : Array
      {
         if(_showArr == null)
         {
            _showArr = show.split(",");
            _showArr = ArrayUtil.itemToInt(_showArr);
         }
         return _showArr;
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         text = param1[1];
         show = param1[2];
         condition = param1[3];
      }
   }
}

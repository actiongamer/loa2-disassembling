package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcHorseupgradeVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_horseupgrade";
       
      
      public var id:int;
      
      public var level:int;
      
      public var name:String;
      
      public var cost:String;
      
      public var skillrank:int;
      
      public var talent:String;
      
      public var talentname:String;
      
      public var talentdesc:String;
      
      public var playerlevel:int;
      
      public function StcHorseupgradeVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         level = param1[1];
         name = param1[2];
         cost = param1[3];
         skillrank = param1[4];
         talent = param1[5];
         talentname = param1[6];
         talentdesc = param1[7];
         playerlevel = param1[8];
      }
   }
}

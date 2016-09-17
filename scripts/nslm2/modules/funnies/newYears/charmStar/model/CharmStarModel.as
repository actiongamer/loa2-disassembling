package nslm2.modules.funnies.newYears.charmStar.model
{
   public class CharmStarModel
   {
       
      
      public var rankInfo:Array;
      
      public var shopInfoArr:Array;
      
      public var shopPropArr:Array;
      
      public var rankRewordArr:Array;
      
      public var score:int;
      
      public var rank:int;
      
      public function CharmStarModel()
      {
         rankInfo = [];
         shopInfoArr = [];
         shopPropArr = [];
         rankRewordArr = [];
         super();
      }
      
      public function dispose() : void
      {
         rankInfo = null;
      }
   }
}

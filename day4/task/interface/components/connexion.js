import { principal } from "../stores"
import { daoActor, ledgerActor } from "../stores"
import { idlFactory as idlFactoryDAO } from "../../src/declarations/dao/dao.did.js"
import { idlFactory as idlLedger } from "../../src/declarations/ledger/icrc1.did.js"
import { HttpAgent, Actor } from "@dfinity/agent"

//TODO : Add your mainnet id whenever you have deployed on the IC
const daoCanisterId = 
  process.env.NODE_ENV === "development" ? "rno2w-sqaaa-aaaaa-aaacq-cai" : "rvpd5-iqaaa-aaaaj-qazsa-cai"

const ledgerCanisterId = 
  process.env.NODE_ENV === "development" ? "db3eq-6iaaa-aaaah-abz6a-cai" : "db3eq-6iaaa-aaaah-abz6a-cai"
// See https://docs.plugwallet.ooo/ for more informations
export async function plugConnection() {
  const result = await window.ic.plug.requestConnect({
    whitelist: [daoCanisterId, ledgerCanisterId],
  })
  if (!result) {
    throw new Error("User denied the connection")
  }

    // await window.ic.plug.createAgent({ whitelist, host: "https://boundary.ic0.app/" })
    // agent = window.ic.plug.agent;

  const p = await window.ic.plug.agent.getPrincipal()

  const agent = new HttpAgent({
    host: process.env.NODE_ENV === "development" ? "http://localhost:8000" : "https://ic0.app",
  });

  if (process.env.NODE_ENV === "development") {
    agent.fetchRootKey();
  }

  const actor = Actor.createActor(idlFactoryDAO, {
    agent,
    canisterId: daoCanisterId,
  });

  const agentProduction = new HttpAgent({
    host: "https://ic0.app",
  });

  const actorLedger = await window.ic.plug.createActor({
    canisterId: ledgerCanisterId,
    interfaceFactory: idlLedger,
  });

  principal.update(() => p)
  daoActor.update(() => actor)
  ledgerActor.update(() => actorLedger)
}

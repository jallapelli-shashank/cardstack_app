import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [
    "milestone",
    "totalSpent"
  ]

  connect() {
    this.formatMilestone();
    this.formatTotalSpent();
  }

  formatAmount(value) {
    return Intl.NumberFormat('en-IN').format(value)
  }

  formatAmountToCompact(value) {
    return Intl.NumberFormat('en-IN', { notation: 'compact', maximumFractionDigits: 1 }).format(value)
  }

  formatMilestone() {
    this.milestoneTargets.forEach(target => {
      const amount = Number(target.dataset.milestone)
      const milestoneDiff = Number(target.dataset.milestoneDiff)
      target.setAttribute('title', milestoneDiff > 0 ? 
        `More ${this.formatAmount(milestoneDiff)}.` : `Milestone Completed`)
      target.textContent = this.formatAmountToCompact(amount)
    })
  }

  formatTotalSpent() {
    this.totalSpentTargets.forEach(target => {
      debugger
      target.textContent = `Total Spent - ${this.formatAmount(target.dataset.totalSpent)}`
    })
  }
}

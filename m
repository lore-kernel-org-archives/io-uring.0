Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57337531AE4
	for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 19:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792092748; cv=none; b=jGWE9cJCUoCkKcI+n5NTeu/m/L72SQ2rqGwy4Tbm8cbbKX2SijctykhCGPCL4HxJG0ElQaF4Z+Dr5EyUENymmlPpKx019oATGywAWUvL9Puragf9wTUzmYkMqJJ9ONWooW5uzteB9OQTf/tMvdG/TBhSWaGk7lVy21i6vDw2b/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792092748; c=relaxed/simple;
	bh=OT/aJWzArc4ra9XmT6GSOmEeSFiDMjr/PTxZ+9eZG0U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QWyJZSBvy6/t2xQtQ86ohq1uCtefGxKwO7AGJmsLRZ+yt9hHGGvBHCpEYQW+70m8Md8i33REvfAEGNf9dQ+fnVYF8vIJ5BrDNKY1lxUHkUSJiENWCXJ+4ejRzPuAqyfaMsxq07j6I1/oe/scYbX7W8YlThUpxJoY2gFpB4t9RvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=TPaEjBHM; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="TPaEjBHM"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-5350cc60b51so78421651cf.1
        for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 12:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1792092746; x=1792697546; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D/JJ1hGBM5W1FcgerOY2BEAOj+4g/tzX1tSS6VZ1XAM=;
        b=TPaEjBHMICp946v5oH8B4vvc5pH2AlX7e2m15WDnm1OHVH1vH1oNKrY9bxqCCQ9dgw
         ygoU9TrYAErt33/zG6v56iogx39MNTlYIcGraMVLWyaIvUyrEEiG42ika66SOzoIpRYa
         jU8CNWy8L5Ev+ZW37eP0VfI/8yez3YmraVO9pRe4pMByaslq0bs8KfqjIMHkps/EpZUU
         UfDG2TMvB0qi1eOUJWq3f6FhyFqDIjvR4lZuxuA/FEKcbwjjXpYFedtC1uTQRjOcXX/c
         GFVLBje2SPszIN4s3CrVMpn0n2JV2bHc8vlnF2gAwfyw3oh9CtaqkCTalVL08aTdzSgj
         pGmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792092746; x=1792697546;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D/JJ1hGBM5W1FcgerOY2BEAOj+4g/tzX1tSS6VZ1XAM=;
        b=Z2xWrBQ7g4q2YSZmW4sV0y6OfIPHXFXHD4Z5mdbGclhPhfXpxMGa/n8TKnL6Xtlh+f
         Kx1KOC9R0g0vMTf/k9wqyRHgpPMwOKCdO771qbgZhc0hAvDJj3PrCtvg2HI2lX0AqeuF
         /5NNnAHRoEdkoomeTGo79P+X9qaO3pzaTxQoBUQqCLZ/16syQTLRRnNBK+5fUjtSP13i
         2uA6WN0Dje+EX41JhKOpRXoa5kq3TWGU/MSp+9xwOwoiXo//adNLuZbu794++rBCoSU7
         leBugeA1CKuxpDUFuBPZKgN1yRS42q/jW2sCrN+GNqeYJddFkU432tkPtYGYhCeOOxwP
         dyAg==
X-Gm-Message-State: AFq9FYKj7QvUOoszyw9l/Fw/osW1G3w2hDQQpPuJjEJZQXXW6kfrdqdS
	nR6hlKVSknqQ8NQTWMGDNPI2jnvgKHKAoZYjtuiZS7o6Z9myGMR4wjZsVjlhNuJhd+4=
X-Gm-Gg: AYBFou32Boi7u1x9icNX3clXsQDfNKglgf919fgsKFL1nL3wSdrH5z+leaGFCSrbyRx
	MvbM16PDaAfLO/srDByZITGKBNXQbQUJAuCEY3/U5wZuwnoEKP6/x/n29Gk/5NEaLJRXKTMFh+a
	NFbt5jeaen3zxcjzGmL99G78nzSu6KXgz84FUMl+vV5GsVofv6q4mVRZ2j9n7e/FUp/74KTmFF+
	GmGpBCOb53gw9sBCYhqjSdWKzDuOoS+ItiiHEQnz7g6DiBEztk926dHGoIIcHab7M6WF+Q1b3PZ
	ACr4RfpxnyiMZZCJI4IRsD5YtVuvKONsqZKJ2EICseE6P0JxjK/Cehz/kTXNfupyKp+8+C6GLKD
	gmGEgLT+qog17UiMoRbJRI6WSXx3yfmKYEMLG4D41Uup5Hav5CMlDheaB0wXPiDjFbHUKeX8LgM
	e1EHUX+y5CUIHiyIHTZmkU3a/4jxBugktL9Awo9ZaHZE3a93SzkkbYpKOlqx9YWG6MX3JYXyZR3
	qRld2taOZmYcvrq
X-Received: by 2002:a05:622a:598c:b0:533:a4a:4d90 with SMTP id d75a77b69052e-5359fb8ce17mr340797851cf.43.1792092746278;
        Thu, 15 Oct 2026 12:32:26 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.249])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5362a8e5831sm1528071cf.10.2026.10.15.12.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:32:25 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 15 Oct 2026 19:31:02 +0000
Subject: [PATCH 38/43] io_uring/openclose: keep the lock in io_pipe_fixed()
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-io-uring-fixes-v1-38-c1556f5d7bf5@toxicpanda.com>
References: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
In-Reply-To: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1792092660; l=1758;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=OT/aJWzArc4ra9XmT6GSOmEeSFiDMjr/PTxZ+9eZG0U=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QFeLM5uzH8VVtqe/Eaaj8p+lmv3Ja2uVsJfKkLtl16Nix5AgHJ3HQ7uTnq+MrrLwGeqpdZoUDfE
 6bLp1WRJJUQQ=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

io_pipe_fixed() installs both ends of the pipe in the fixed file table,
drops ->uring_lock, and copies the slot numbers to the application. If
that faults, it takes the lock again and removes whatever is in these
slots.

If the request is run by io-wq the lock really is dropped in between, and
the slots are visible to everybody else. By the time the error path gets
to them, they may have been closed and reused, by IORING_OP_CLOSE and a
direct open or accept, or by IORING_REGISTER_FILES_UPDATE. Then a file is
removed from the table that has nothing to do with the failed request.

Do the copy with the lock held. Faulting in user memory under
->uring_lock is fine, the registration paths do it all the time.

Fixes: 53db8a71ecb4 ("io_uring: add support for IORING_OP_PIPE")
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 io_uring/openclose.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/io_uring/openclose.c b/io_uring/openclose.c
index c71242915dad..24cf3ce2e2bc 100644
--- a/io_uring/openclose.c
+++ b/io_uring/openclose.c
@@ -375,13 +375,16 @@ static int io_pipe_fixed(struct io_kiocb *req, struct file **files,
 	fds[1] = alloc_slot ? ret : slot - 1;
 	files[1] = NULL;
 
-	io_ring_submit_unlock(ctx, issue_flags);
-
-	if (!copy_to_user(p->fds, fds, sizeof(fds)))
+	/*
+	 * Hang on to the lock. If this fails, the slots have to be cleared, and
+	 * they must still hold what was put there.
+	 */
+	if (!copy_to_user(p->fds, fds, sizeof(fds))) {
+		io_ring_submit_unlock(ctx, issue_flags);
 		return 0;
+	}
 
 	ret = -EFAULT;
-	io_ring_submit_lock(ctx, issue_flags);
 err:
 	if (fds[0] != -1)
 		io_fixed_fd_remove(ctx, fds[0]);

-- 
2.55.0

